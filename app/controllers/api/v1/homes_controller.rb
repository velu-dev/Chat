module Api
  module V1
class HomeController < ApplicationController
  def home
  end

  def contact
  end
  def edit
    @user ||= User.find(params[:format])
    render json: @user
  end
  def update
  
    @user ||= User.find(current_user.id)
    @user.update(edit_params)
    redirect_to homes_profile_path
    render json: @user
  end
  private
  def edit_params
   params.require(:user).permit!
  end

end
end
end