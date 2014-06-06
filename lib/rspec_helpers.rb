require_relative './api_client'

module CaringBridge
  module Helpers
    def client
      @client ||= CaringBridge::Client.new
    end

    def signin(email, password)
      response = client.post do |req|
        req.service = :profile
        req.method = :login
        req.params = {
          :email =>    email,
          :password => password,
        }
      end
      expect(response).to be_success
      return response.body["result"]["profile"]
    end
  end
end
