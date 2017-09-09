class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?
after_action :user_activity

def after_inactive_sign_up_path_for(resource)
    user_session_path
  end

def after_sign_in_path_for(resource)
    homes_home_path
end


private

def user_activity
  current_user.try :touch
end

def configure_permitted_parameters
devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_pic,:fname,:mobile,:gender,:status])
end
end
