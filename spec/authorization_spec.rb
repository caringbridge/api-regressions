describe "Authorization (Profile)" do
  it "signs in a user" do
    response = client.post do |req|
      req.service = :profile
      req.method = :login
      req.params = {
        :email =>    'svandahm@caringbridge.org',
        :password => '123456',
      }
    end

    expect(response).to be_success

    body = response.body
    expect(body).to include("result")
    expect(body["result"]).to include("profile")
    expect(body["result"]).to include("lastLogin")

    profile = body["result"]["profile"]
    expected = {
      "firstName" => "Stephen",
      "lastName"  => "Van Dahm",
      "email"     => "svandahm@caringbridge.org",
      "id"        => 520,
    }
    expect(profile).to include(expected)
  end
end
