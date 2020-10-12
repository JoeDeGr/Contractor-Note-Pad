class SessionsController < ApplicationController
  skip_before_action :require_login
  skip_before_action :current_user
  
  def index
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "User or password not found."
      binding.pry
      render 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
