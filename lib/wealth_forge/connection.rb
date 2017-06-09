require 'openssl'
require 'faraday'
require 'json'
require 'csv'
require 'timeout'
require 'resolv-replace'


class WealthForge::Connection

  def self.post(endpoint, params)
    begin
      response = connection.post do |req|
        req.url endpoint
        req.headers['Content-Type'] = 'application/json'
        req.body = prep_params(params)
      end
      JSON.parse(response.body, symbolize_names: true)
    rescue => e
      raise WealthForge::ApiException.new(e)
    end
  end


  def self.put(endpoint, params)
    begin
      response = connection.put do |req|
        req.url endpoint
        req.headers['Content-Type'] = 'application/json'
        req.body = prep_params(params)
      end
      JSON.parse(response.body, symbolize_names: true)
    rescue => e
      raise WealthForge::ApiException.new(e)
    end
  end


  def self.get(endpoint, params, raw=false)
    begin
      response = connection.get do |req|
        req.url endpoint
        req.headers['Content-Type'] = 'application/json'
        req.body = prep_params(params)
      end
      raw == false ? JSON.parse(response.body, symbolize_names: true) : response.body
    rescue => e
      raise WealthForge::ApiException.new(e)
    end
  end


  private


  def self.prep_params(params)
    return if params.nil?
    wf_params = {}
    params.each do |key, value|
      wf_params[key.to_s.camelize(:lower)] = value
    end
    wf_params.to_json
  end


  def self.connection
    api_endpoint = (!ENV['ENVIRONMENT'].nil? and ENV['ENVIRONMENT'].eql? 'production') ? 
      'https://www.capitalforge.com/capitalforge-transaction/api/' : 
      'https://sandbox.capitalforge.com/capitalforge-transaction/api/'
    return Faraday.new(:url => api_endpoint, :ssl => ssl_options) do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end


  def self.ssl_options
    wf_cert = !WealthForge.configuration.wf_crt.nil? ? WealthForge.configuration.wf_crt : File.read(WealthForge.configuration.wf_crt_file)
    wf_key  = !WealthForge.configuration.wf_key.nil? ? WealthForge.configuration.wf_key : File.read(WealthForge.configuration.wf_key_file)
    ssl_options = {
      :version => :TLSv1,
      :client_cert => OpenSSL::X509::Certificate.new(wf_cert),
      :client_key  => OpenSSL::PKey::RSA.new(wf_key),
      :ca_path     => '/usr/lib/ssl/certs'
    }
    ssl_options  
  end

end
