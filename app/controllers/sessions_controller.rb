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
      render 'new'
    end
  end

  def o_auth
    @user = User.find_or_create_by(name: auth[:info][:name], email: auth[:info][:email])
      @user.save(:validate => false)
    if @user
      session[:user_id] = @user.id
      render 'users/show'
    else
      flash[:alert] = "User not found."
      render 'index'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
