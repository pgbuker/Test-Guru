class ApplicationController < ActionController::Base


  before_action :configure_sign_up_params, if: :devise_controller?
  before_action :authenticate_user!
  
  
  
  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
  end

  def after_sign_in_path_for(current_user)
    flash[:notice] = "Hello, #{current_user.name}!"
    if current_user.admin?
      admin_tests_path
    else
      root_path
    end
  end

end
