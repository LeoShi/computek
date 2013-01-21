require 'spec_helper'

describe User do
  describe "when create success " do
    before(:each) do
      @user_info = {:email => "abc@abc.com", :password => "123456"}
    end

    it "will not save if no name or phone" do
      user = User.new(@user_info)
      user.should_not be_valid
    end

    it "will save if name or phone" do
      user = User.new(@user_info.merge({:name => "name", :phone => "12345"}))
      user.should be_valid
    end
  end
end
