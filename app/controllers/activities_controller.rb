class ActivitiesController < ApplicationController

  def show 
    activity = Activity.find(params[:id])
    render json: activity
  end 

  def index 
    activities = Activity.all
    render json: activities 
  end 

  def destroy
    activity = Activity.find_by(id: params[:id])
    if activity
      activity.destroy
      head :no_content
    else
      render json: { error: "Activity not found" }, status: :not_found
    end  
  end 

end
