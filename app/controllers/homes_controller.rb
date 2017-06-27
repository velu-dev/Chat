class HomesController < ApplicationController
  def home
  end

  def contact
  end
  def edit
  	@user= User.find(params[:format])
  	
  end
  def update
  	byebug
    @user = User.find(edit_params)
    @user.update
  end
  private
  def edit_params
   params.permit!
  end

end
