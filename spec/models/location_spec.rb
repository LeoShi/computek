require 'spec_helper'

describe Location do
  before (:each) do
    @incident = stub_model(Incident)

  end
  describe "create failed when" do
    it "latitude or longitude is empty" do
      location = Location.new({:latitude => "-12.34567"}.merge({:incident => @incident}))
      location.should_not be_valid
    end
  end

  describe "create successful" do
   it "only given latitude and longitude" do
     location = Location.new({:latitude => "-12.34567", :longitude => "123.3456"}.merge({:incident => @incident}))
     location.should be_valid
   end
  end
end
