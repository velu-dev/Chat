class HomesController < ApplicationController
  def home
     current_user.update(status: true)
     @user =  User.where("updated_at >?", (Time.now-20.minutes).utc)
  end

  def contact
  end
  def edit
  	@user = User.find(params[:format])
  	
  end
  def update
  
    @user = User.find(current_user.id)
    @user.update(edit_params)
    redirect_to homes_profile_path
  end
  def logout
    byebug
    user_session = nil
    current_user.update(status: false)
    current_user = nil
     redirect_to  user_session_path
  end
  private
  def edit_params
   params.require(:user).permit!
  end

end
