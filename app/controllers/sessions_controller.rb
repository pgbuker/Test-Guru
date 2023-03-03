class SessionsController < ApplicationController
  helper_method :destroy_session

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:path] || tests_path
    else
      flash.now[:alert] = 'Введите почту и пароль!'
      render :new 
    end 
  end

  def destroy
    reset_session
    redirect_to login_path    
  end
end
