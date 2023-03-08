class ApplicationController < ActionController::Base


  before_action :configure_sign_up_params, if: :devise_controller?
  before_action :authenticate_user!
  
  
  
  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
  end

  def after_sign_in_path_for(current_user)
    if current_user.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end

end
