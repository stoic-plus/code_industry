class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      flash[:message] = "You're logged in"
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:message] = "Incorrect credentials"
      redirect_to login_path
    end
  end
end
