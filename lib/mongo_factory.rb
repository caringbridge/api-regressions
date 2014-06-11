require 'ostruct'
require 'mongo'

module CaringBridge
  class MongoFactory
    class << self
      attr_accessor :config
    end
    
    @config = OpenStruct.new({
        :hostname => "test.caringbridge.org",
        :port => 27017,
        :database => 'CB',
    })

    def initialize(config = nil)
      config = self.class.config if config.nil?
      @client = Mongo::MongoClient.new(config.hostname, config.port)
    end

    def db
      @client[self.class.config.database]
    end

    def client
      @client
    end
  end
end
