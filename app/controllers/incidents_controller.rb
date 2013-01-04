class IncidentsController < ApplicationController
  def index
    @incidents = Incident.all
  end

  def create
    incident = Incident.new(params[:incident])
    if incident.save
      render :json => {:reference => incident.reference}.to_json, :status => :created
    else
      render :json => incident.errors, :status => :unprocessable_entity
    end
  end
end
