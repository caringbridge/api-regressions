require 'faraday'
require 'ostruct'
require 'json'

module CaringBridge
  class Client

    class << self
      attr_accessor :options
    end

    @options = OpenStruct.new({
        :url => 'http://test.caringbridge.org/v2/',
        :ssl => {:verify => false},
    })

    def initialize(options = nil)
      options = options ||= self.class.options
      @client = Faraday.new(options.to_h) do |faraday|
        faraday.request  :url_encoded
        #faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
      @token = nil
    end

    def faraday
      @client
    end

    def get_token
      return @token if @token

      rsp = post do |req|
        req.service = :token
        req.method = :acquire
      end

      # TODO: make an exception class for this.
      raise Exception.new "Could not retrieve API token" unless rsp.success?

      @token = rsp.body["result"]["token"]
    end

    def post(&block)
      request = Struct.new(:service, :method, :params).new
      request.params = {}

      yield request

      request.each_pair do |k,v|
        raise ArgumentError.new("#{k.to_s} can't be nil") if v.nil?
      end

      unless request.params.respond_to? :keys and request.params.respond_to? :[]
        raise ArgumentError.new("body must be a hash")
      end

      params = request.params
      params[:cb_token] = get_token unless request.service.to_s == "token"

      payload = {
        :method => request.method,
        :jsonrpc => "2.0",
      }

      payload[:params] = [params] if params.length > 0

      response = @client.post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.url "#{request.service}/json"
        req.body = JSON.generate payload
      end

      return Response.new(response, payload)
    end
  end

  class Response
    def initialize(faraday_response, request=nil)
      @response = faraday_response
      @body = JSON.parse @response.body
      @request = request
    end

    def http_success?
      @response.success?
    end

    def success?
      @response.success? and @body.has_key? "result"
    end

    def error?
      @body.has_key? "error"
    end

    def method_missing(method, *args)
      @response.send(method, *args)
    end

    def body
      @body
    end

    def request
      @request
    end
  end
end
