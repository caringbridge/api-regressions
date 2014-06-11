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

  # Stephen generated the remainder of these specs with a script.
  it "tests the :logout method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :logout
    #  req.params  = {}
    #end
  end
  it "tests the :forgotPassword method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :forgotPassword
    #  req.params  = {}
    #end
  end
  it "tests the :countAuthorVisitedSites method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :countAuthorVisitedSites
    #  req.params  = {}
    #end
  end
  it "tests the :countVisitedSites method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :countVisitedSites
    #  req.params  = {}
    #end
  end
  it "tests the :countAuthoredSites method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :countAuthoredSites
    #  req.params  = {}
    #end
  end
  it "tests the :countAuthorVisitedPlanners method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :countAuthorVisitedPlanners
    #  req.params  = {}
    #end
  end
  it "tests the :countVisitedPlanners method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :countVisitedPlanners
    #  req.params  = {}
    #end
  end
  it "tests the :listAuthorVisitedSites method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :listAuthorVisitedSites
    #  req.params  = {}
    #end
  end
  it "tests the :listAuthoredSites method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :listAuthoredSites
    #  req.params  = {}
    #end
  end
  it "tests the :listVisitedSites method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :listVisitedSites
    #  req.params  = {}
    #end
  end
  it "tests the :listAuthorVisitedPlanners method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :listAuthorVisitedPlanners
    #  req.params  = {}
    #end
  end
  it "tests the :listVisitedPlanners method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :listVisitedPlanners
    #  req.params  = {}
    #end
  end
  it "tests the :getSitesNewJournalCount method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :getSitesNewJournalCount
    #  req.params  = {}
    #end
  end
  it "tests the :removeSiteFromSiteList method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :removeSiteFromSiteList
    #  req.params  = {}
    #end
  end
  it "tests the :removePlannerFromPlannerList method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :removePlannerFromPlannerList
    #  req.params  = {}
    #end
  end
  it "tests the :addEmail method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :addEmail
    #  req.params  = {}
    #end
  end
  it "tests the :add method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :add
    #  req.params  = {}
    #end
  end
  it "tests the :edit method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :edit
    #  req.params  = {}
    #end
  end
  it "tests the :changePassword method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :changePassword
    #  req.params  = {}
    #end
  end
  it "tests the :resetPassword method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :resetPassword
    #  req.params  = {}
    #end
  end
  it "tests the :isAllowed method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :isAllowed
    #  req.params  = {}
    #end
  end
  it "tests the :getFeed method" do
    pending("Not yet implemented")
    expect(true).to eq(false) # Deliberate failure
    #response = client.post do |req|
    #  req.service = :profile
    #  req.method  = :getFeed
    #  req.params  = {}
    #end
  end
end
