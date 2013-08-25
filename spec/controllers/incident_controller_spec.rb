require 'spec_helper'

describe IncidentsController do

  describe "POST 'create'" do
    let(:valid_incident_data) { {:category => "House Break in", :mobile_user_id => create(:mobile_user).id,
                           :location_attributes => {:latitude => "-26.1940509", :longitude => "28.0359692",
                                                    :street => "17 Melle Street, Johannesburg 2000, South Africa"}}}
    let(:invalid_incident_data) { {:category => "House Break in", :mobile_user => stub_model(MobileUser)}}

    ['House Break in,HSB','Domestic Violence,DOV',
     'Hijack,HIJ', 'Suspects,SUS',
     'Animal abuse,AAB', 'Shooting,SHO',
     'Murder,MUR', 'Illegal Firearm,ILF',
     'Drug Dealing,DRD', 'Drug Use,DRU'].each do |item|
      incident_name, abbr = item.split(',')
      it "with '#{incident_name}'" do
        post 'create', {:incident => valid_incident_data.merge(:category => incident_name), :format => :json}
        response.should be_success
        result = JSON.parse(response.body)
        result["reference"].should start_with abbr
      end
    end

    it "with failed" do
      post :create, {:incident => invalid_incident_data, :format => :json}
      response.status.should eq(422)
    end
  end

  describe "GET 'index'" do
    login_admin

    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "assign all incidents to @incidents" do
      stub_result = [stub_model(Incident)]
      stub_result.stub(:order) { stub_result }
      Incident.stub(:page) { stub_result }
      get :index
      expect(assigns(:incidents)).to eq(stub_result)
    end
  end

  describe "update" do
    let(:valid_incident_data) { {:category => "House Break in", :mobile_user_id => create(:mobile_user).id,
                                 :location_attributes => {:latitude => "-26.1940509", :longitude => "28.0359692",
                                                          :street => "17 Melle Street, Johannesburg 2000, South Africa"}}}

    login_control_officer

    it "should update incident success" do
      post 'create', {:incident => valid_incident_data, :format => :json}
      response.should be_success
      result = JSON.parse(response.body)

      put 'update', {:id => result['id'], :incident => {:status => 'Withdrawn'}, :format => :json}
      response.should be_success
      result = JSON.parse(response.body)
      result['status'].should eq('Withdrawn')
    end

  end

end
