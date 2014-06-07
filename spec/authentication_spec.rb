describe "Authentication (Profile)" do
  before(:each) do
    # Fetch the user from the DB
    @user = collections['profile'].find_one({
      'email.address' => 'svandahm@caringbridge.org',
    })

    @expected_fields = {
      "firstName" => @user["firstName"],
      "lastName"  => @user["lastName"],
      "email"     => @user["email"]["address"],
      "id"        => @user["_id"],
    }
  end

  it "signs in a user with an email address and password" do
    response = CaringBridge::Client.new.post do |req|
      req.service = :profile
      req.method = :login
      req.params = {
        :email =>    'svandahm@caringbridge.org',
        :password => '123456',
      }
    end

    expect(response).to be_success
    expect(response.body["result"]).to include("lastLogin")

    profile = response.body["result"]["profile"]
    expect(profile).to include(@expected_fields)
  end

  it "signs in a user with a guid" do

    response = CaringBridge::Client.new.post do |req|
      req.service = :profile
      req.method = :loginByGuid
      req.params = {
        :guid => @user['guid']
      }
    end

    expect(response).to be_success
    expect(response.body["result"]).to include("lastLogin")

    profile = response.body["result"]["profile"]
    expect(profile).to include(@expected_fields)
  end
  
end
