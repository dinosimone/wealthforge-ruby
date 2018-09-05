require 'openssl'
require 'faraday'
require 'json'
require 'csv'
require 'timeout'
require 'resolv-replace'
require 'jwt'
require 'pp'

class WealthForge::Connection

  def self.post(endpoint, params)
    begin
      response = connection.post do |req|
        req.url endpoint
        req.headers['Content-Type'] = 'application/json'
        req.body = params.to_json
    end
    rescue => e
      raise WealthForge::ApiException.new(e)
    end
    result = JSON.parse(response.body)
    check_result(result)
    result
  end


  def self.get(endpoint, params)
    begin
      response = connection.get do |req|
        req.url endpoint
        req.headers['Content-Type'] = 'application/json'
        req.body = params.to_json
      end
    rescue => e
      raise WealthForge::ApiException.new(e)
    end
    JSON.parse(response.body)
  end


  def self.file_upload (endpoint, file, filename, mime_type)
    payload = {:file => Faraday::UploadIO.new(file, mime_type, filename)}
    begin
      response = connection_multipart.post do |req|
        req.url endpoint
        req.body = payload
      end
    rescue => e
      raise WealthForge::ApiException.new(e)
    end
    JSON.parse(response.body)
  end


  def self.connection
    set_token
    return Faraday.new(:url => @api_url) do |faraday|
      faraday.request :url_encoded
      faraday.headers['Authorization'] = @wf_token
      faraday.adapter Faraday.default_adapter
      faraday.use CustomErrors
    end
  end


  def self.check_result(result)
    pp result
    unless result['errors'].nil?
      pp result
    end
  end


  def self.connection_multipart
    set_token
    return Faraday.new(:url => @api_url) do |faraday|
      faraday.request :multipart
      faraday.headers['Authorization'] = @wf_token
      faraday.adapter Faraday.default_adapter
      faraday.use CustomErrors
    end
  end


  def self.set_token 
    if @wf_token == nil
      @wf_client_id     = WealthForge.configuration.client_id
      @wf_client_secret = WealthForge.configuration.client_secret
      @api_url          = WealthForge.configuration.api_url
      @token_url        = WealthForge.configuration.token_url
      @wf_token         = retrieve_token
    end

    # test to see if token has expired
    t = @wf_token.reverse.chomp("Bearer ".reverse).reverse
    decoded_token = JWT.decode t, nil, false
    token_exp = decoded_token[0]['exp']
    leeway = 60
    now = Time.now.to_i 
    token_window = token_exp - leeway 
    refresh_token = !(token_window > now)
   
    if refresh_token == true
       # makes a call to get a new token
      @wf_token = retrieve_token
    end 
  end 


  def self.retrieve_token
    auth = Faraday.new.post(@token_url) do |faraday|
      faraday.body = {
        data: {
          attributes: {
            clientId: @wf_client_id,
            clientSecret: @wf_client_secret
          },
          type: 'token'
        }
      }.to_json
    end.body
    @wf_token = 'Bearer ' + JSON.parse(auth)['data']['attributes']['accessToken']
  end
end


class CustomErrors < Faraday::Response::RaiseError

  def on_complete(env)
    case env[:status]
    when 400...600
      json_body = JSON.parse(env[:body])
      return json_body
    else
      super
    end
  end

end

