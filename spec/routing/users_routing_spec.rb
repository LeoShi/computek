require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to users#create" do
      post("/users").should route_to("users#create")
    end
    it "routes to incidents#index" do
      get("/incidents").should route_to("incidents#index")
    end
    it "routes to incidents#create" do
      post("/incidents").should route_to("incidents#create")
    end

  end
end
