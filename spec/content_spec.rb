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
end
