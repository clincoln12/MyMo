class UsersController < ApplicationController

  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.alert = @user.errors.full_messages[0]
      render :new
    end
  end 

  def show
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    if @user == nil
      redirect_to '/'
    elsif current_user.id != @user.id
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
