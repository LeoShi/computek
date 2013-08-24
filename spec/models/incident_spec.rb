require 'spec_helper'

describe Incident do
  before (:each) do
    @mobile_user = create(:mobile_user, :name => "user1")
  end
  describe "After create Incident successfully" do
    before (:each) do
      create(:dispatcher)
      @valid_incident_data = {:category => "House Break in", :mobile_user => @mobile_user,
                        :location_attributes => {:latitude => "-26.1940509", :longitude => "28.0359692",
                                                 :street => "17 Melle Street, Johannesburg 2000, South Africa"}}
    end

    subject(:incident) {Incident.create(@valid_incident_data)}

    it {should be_valid}
    it "should create location" do
      expect(incident.location.latitude).to eq("-26.1940509")
    end
    it "should generate reference properly" do
      incident.reference.length.should eq(13)
      incident.reference.should start_with("HSB")
    end

    it "should have default handling officer" do
       incident.user.should_not be_nil
    end
    it "status should be opened" do
      incident.status.should eq "Open"
    end
  end

  describe "should not create Incident" do
    before(:each) do
      @invalid_incident_data = {:category => "House Break in", :mobile_user => @mobile_user}
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
