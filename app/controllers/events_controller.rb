class EventsController < ApplicationController
  def index
    @project = Project.find(params[:project_id]) if params[:project_id]
    @events = Event.includes(:user, :target).by_project(@project).page(params[:page]).per(50)
  end
end
