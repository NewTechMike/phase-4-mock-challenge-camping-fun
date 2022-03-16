class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  def create 
    signup = Signup.create!(camper_id: params[:camper_id], activity_id: params[:activity_id], time: params[:time])
    render json: signup.activity, status: :created
  end 

  private 

  def render_invalid_response(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end 
end
