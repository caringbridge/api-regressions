require_relative './api_client'
require_relative './mongo_factory'
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

    def mongo
      @mongo ||= CaringBridge::MongoFactory.new
    end

    def collections
      mongo.db
    end
  end
end
