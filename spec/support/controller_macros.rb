module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end

  def login_captain
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:dispatcher]
      user = FactoryGirl.create(:dispatcher)
      sign_in user
    end
  end

  def login_control_officer
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:control_officer]
      user = FactoryGirl.create(:control_officer)
      sign_in user
    end
  end
end