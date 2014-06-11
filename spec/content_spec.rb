describe "Content Service" do
  include_context "authenticated"
  it "displays a mobile donation message" do
    response = client.post do |req|
      req.service = :content
      req.method = :fetchMessage
      req.params = {
        :page => "mobile-donate"
      }
    end

    expect(response).to be_success
  end

  # Stephen generated these blank specs with a script.
  it "tests the :fetch method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :content
    #  req.method  = :fetch
    #  req.params  = {}
    #end
  end
  it "tests the :fetchMessage method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :content
    #  req.method  = :fetchMessage
    #  req.params  = {}
    #end
  end
  it "tests the :fetchCareposts method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :content
    #  req.method  = :fetchCareposts
    #  req.params  = {}
    #end
  end
end
