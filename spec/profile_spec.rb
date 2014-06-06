describe "Profile Service" do
  include_context "authenticated"

  it "fetches a site list" do
    response = client.post do |req|
      req.service = :profile
      req.method = :listAuthorVisitedSites
      req.params = {
        :id => @profile["id"],
        :limit => 20,
      }
    end

    expect(response).to be_success
    sites = response.body["result"]["sites"]

    # Does it respect the paginator?
    expect(sites.length).to be <= 20
    expect(response.body["result"]["more"]).to eq(false)

    expected = [
      "siteName",
      "siteTitle",
      "firstName",
      "lastName"
    ]

    sites.each do |site|
      expected.each {|e| expect(site).to include(e)}
    end
  end
end
