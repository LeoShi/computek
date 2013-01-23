class RegistrationsController < Devise::RegistrationsController
  skip_filter :require_no_authentication
  before_filter :require_admin_or_captain

  def new
    authorize! :create_user, current_user
    super
  end

  protected
  def require_admin_or_captain
    if not user_signed_in? or current_user.role == :control_officer
      redirect_to root_url
    end
  end
end