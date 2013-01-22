class MobileUsersController < ApplicationController
  skip_before_filter :authenticate_user!
  # POST /mobile_users
  # POST /mobile_users.json
  def create
    @mobile_user = MobileUser.new(params[:mobile_user])

    respond_to do |format|
      if @mobile_user.save
        format.json { render json: @mobile_user, status: :created }
      else
        format.json { render json: @mobile_user.errors, status: :unprocessable_entity }
      end
    end
  end
end
