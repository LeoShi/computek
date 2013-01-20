require "spec_helper"

describe MobileUsersController do
  describe "routing" do

    it "routes to users#create" do
      post("/mobile_users").should route_to("mobile_users#create")
    end
    it "routes to incidents#index" do
      get("/incidents").should route_to("incidents#index")
    end
    it "routes to incidents#create" do
      post("/incidents").should route_to("incidents#create")
    end

  end
end
