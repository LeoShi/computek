require 'spec_helper'

describe IncidentsController do

  describe "POST 'create'" do
    let(:valid_incident_data) { {:category => "House Break in", :user_id => create(:user).id,
                           :location_attributes => {:latitude => "-26.1940509", :longitude => "28.0359692",
                                                    :street => "17 Melle Street, Johannesburg 2000, South Africa"}}}
    let(:invalid_incident_data) { {:category => "House Break in", :user => stub_model(User)}}

    it "with success" do
      post 'create', {:incident => valid_incident_data, :format => :json}
      response.should be_success
      response.body["reference"].should_not be_empty
    end

    it "with failed" do
      post :create, {:incident => invalid_incident_data, :format => :json}
      response.status.should eq(422)
    end

  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "assign all incidents to @incidents" do
      stub_result = [stub_model(Incident)]
      Incident.stub(:all) { stub_result }
      get :index
      expect(assigns(:incidents)).to eq(stub_result)
    end
  end

end
