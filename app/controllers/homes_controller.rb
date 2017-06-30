class HomesController < ApplicationController
  def home
  end

  def contact
  end
  def edit
  	@user ||= User.find(params[:format])
  	
  end
  def update
  
    @user ||= User.find(current_user.id)
    @user.update(edit_params)
    redirect_to homes_profile_path
  end
  private
  def edit_params
   params.require(:user).permit!
  end

end
