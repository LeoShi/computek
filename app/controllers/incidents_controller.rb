class IncidentsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :create

  def index
    if current_user.role.to_sym  == :control_officer
      @incidents = Incident.where(:user_id => current_user.id).page(params[:page]).order('updated_at DESC')
    else
      @incidents = Incident.page(params[:page]).order('updated_at DESC')
    end

    @incidents = @incidents.where("updated_at > ?", params[:last_update_time]) if params[:last_update_time]

    respond_to do |format|
      format.html
      format.any(:xml, :json) { render request.format.to_sym => @incidents }
    end
  end

  def create
    incident = Incident.new(params[:incident])
    if incident.save
      render :json => {:reference => incident.reference, :id => incident.id}.to_json, :status => :created
    else
      render :json => incident.errors, :status => :unprocessable_entity
    end
  end

  def edit
    @incident = Incident.find(params[:id])
  end

  def update
    @incident = Incident.find(params[:id])
    if @incident.update_attributes(params[:incident])
      respond_to do |format|
        format.html do
          redirect_to({:action => "edit"}, :notice => 'Incident was successfully updated.')
        end
        format.any(:xml, :json) {render request.format.to_sym => @incident, :status => :created }
      end
    else
      render :action => "edit"
    end
  end
end
