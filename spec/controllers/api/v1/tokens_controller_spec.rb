require 'spec_helper'

describe Api::V1::TokensController do

  let(:admin) {FactoryGirl.create(:admin)}

  describe "POST 'create' " do
    it "with valid credit should returns token" do
      post 'create', {:email => admin.email, :password => admin.password}
      response.should be_success
      result = JSON.parse(response.body)
      result["token"].should_not be_nil
    end

    it " with invalid credit should returns error msg" do
      post 'create', {:email => "aa", :password => "invalid_pwd"}
      response.status.should eq(401)
    end
  end

  describe "DELETE 'destroy'" do
    it " with valid token returns http success" do
      delete "destroy", {:id => admin.authentication_token}
      response.should be_success
    end
  end

end
