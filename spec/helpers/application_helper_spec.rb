require 'spec_helper'

describe ApplicationHelper do
  include Devise::TestHelpers
  describe "admin" do

    it "should see all the roles" do
      nil.stub(:role => "admin")
      helper.role_list.should eq User::ROLES
    end

    it "captain should see only control_officer role" do
      nil.stub(:role => "captain")
      helper.role_list.should eq "control_officer"
      end

    it "control_officer should not see any of the role" do
      nil.stub(:role => "control_officer")
      helper.role_list.should be_empty
    end
  end

end
