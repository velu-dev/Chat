class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
    super
  byebug
  current_user.update(status: false)
  end

  # POST /resource/sign_in
   def create
    super
      User = User.find_by_email(params[:email])
      user.update(status: true)
   end

  # DELETE /resource/sign_out
  def destroy
     super
    current_user.update(status: false)
   end

 

   def login
  #   user = 

   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
