module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end

  def login_captain
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:captain]
      user = FactoryGirl.create(:captain)
      user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in user
    end
  end

  def login_control_officer
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:control_officer]
      user = FactoryGirl.create(:control_officer)
      user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in user
    end
  end
end