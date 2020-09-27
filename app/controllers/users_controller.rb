class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.valid? && (params[:password] == params[:password_confirmation])
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end 

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
