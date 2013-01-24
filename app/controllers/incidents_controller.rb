class IncidentsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :create

  def index
    @incidents = Incident.page(params[:page]).order('updated_at DESC')
  end

  def create
    incident = Incident.new(params[:incident])
    if incident.save
      render :json => {:reference => incident.reference}.to_json, :status => :created
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
      redirect_to({:action => "edit"}, :notice => 'Incident was successfully updated.')
    else
      render :action => "edit"
    end
  end
end
