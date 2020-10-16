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
      raise params.inspect
      render 'new'
    end
  end

  def o_auth
    @user = User.find_or_create_by(name: auth['name'], email: auth['email']) do |u|
      # u.name = auth['info']['name']
      # u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
    session[:user_id] = @user.id

    render 'user/show'
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
