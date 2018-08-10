class WealthForge::Investment

    def self.create(params = {})
      WealthForge::Connection.post 'subscriptions', params
    end

    def self.get(subscription_id)
      WealthForge::Connection.get "subscriptions/#{subscription_id}", nil
    end

    def self.file_upload(file_path, mime_type, filename, subscription_id)
      WealthForge::Connection.file_upload "files/#{subscription_id}", file_path, filename, mime_type
    end

    def self.cancel_subscription(subscription_id)
        WealthForge::Connection.patch "subscriptions/#{subscription_id}/status/SPONSOR_CANCELLED", nil
    end

end
