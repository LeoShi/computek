require 'spec_helper'

describe Incident do
  before (:each) do
    @user = create(:user, :name => "user1")
  end
  describe "After create Incident successfully" do
    before (:each) do
      @valid_incident_data = {:category => "House Break in", :user => @user,
                        :location_attributes => {:latitude => "-26.1940509", :longitude => "28.0359692",
                                                 :street => "17 Melle Street, Johannesburg 2000, South Africa"}}
    end
    it "should create location" do
      incident = Incident.create(@valid_incident_data)

      expect(incident.location.latitude).to eq("-26.1940509")
    end
  end

  describe "should not create Incident" do
    before(:each) do
      @invalid_incident_data = {:category => "House Break in", :user => @user}
    end
    it "given data without location info" do
      incident = Incident.new(@invalid_incident_data)
      incident.should_not be_valid
      incident.errors.messages[:location].should eq(["can't be blank"])
    end

    it "given data with only part of location info" do
      @invalid_incident_data.merge!({:location_attributes => {:latitude => "-12.3456"}})
      incident = Incident.new(@invalid_incident_data)
      incident.should_not be_valid
      incident.errors.messages[:"location.longitude"].should eq(["can't be blank"])
    end
  end
end
