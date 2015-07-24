class Api::V1::BaseController < ApplicationController

  private
  def find_user
    if params[:user_id].present?
      begin
        @user = User.find(params[:user_id])
      rescue ActiveRecord::RecordNotFound
        render json: {message: 'No user found with that id'}, status: :unauthorized
      end
    else
      render json: { error: 'You need to supply user_id' }, status: :bad_request
    end
  end
  
end
