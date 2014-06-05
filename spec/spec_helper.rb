Rspec.configure do |config|
  config.include Requests::JsonHelpers, :type => :controller
end
