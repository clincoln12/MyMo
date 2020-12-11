class ApplicationController < ActionController::Base

  #gives access to methods in the views
  helper_method :current_user, :logged_in?, :monthly_payment, :annual_payment

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end

  def monthly_payment
    s = current_user.subscriptions
    s.sum(:fee)
  end

  def annual_payment
    monthly_payment * 12
  end
end
