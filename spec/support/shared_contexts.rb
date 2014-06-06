shared_context "authenticated" do
  before { @profile = signin('svandahm@caringbridge.org', '123456') }
end
