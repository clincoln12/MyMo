class SessionsController < ApplicationController
  def home
    redirect_to subscriptions_path if logged_in?
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to subscriptions_path
    else
      flash.alert = "Invalid login credentials. Please try again."
      redirect_to '/login'
    end
  end

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end