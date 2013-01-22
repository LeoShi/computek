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
end
