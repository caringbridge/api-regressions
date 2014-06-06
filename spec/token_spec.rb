describe "Token Service" do
  # We'll inspect this one more thoroughly, because it works a little differently
  # and is so fundamental to the rest of the API.
  it "fetches a token" do
    client = CaringBridge::Client.new.faraday

    response = client.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.url "token/json"
      req.body = JSON.generate({
        :jsonrpc => "2.0",
        :method => "acquire"
      })
    end

    response = JSON.parse(response.body)

    expect(response).to include("result")
    expect(response["result"]).to include("token")
  end
end
