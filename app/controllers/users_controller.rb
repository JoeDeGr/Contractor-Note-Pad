class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    skip_before_action :current_user, only: [:new, :create]

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
        @tasks = @user.tasks
    end

    def edit
    end

    def update
        @user.update(user_params)
        if @user.valid? && (params[:password] == params[:password_confirmation])
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end 

    def destroy
        
        @user.tasks.each do |t|
            t.materials.each do |m|
                m.destroy
            end
            t.destroy
        end
        @user.punch_lists.each do |p|
            p.destroy
        end
        @user.projects.each do |p|
            p.destroy
        end
        @user.workers.each do |w|
            w.destroy
        end
        @user.destroy
        redirect_to root_path
    end

    def search_workers
        @task = Task.find_by(name: params[:task])
        if @task == nil
            flash[:notice] = "Task not found."
            redirect_to user_path(@user)   
        else
            if @task.user.id == session[:user_id]
                @task_workers = User.search_for_task_workers(params[:task])
        
            else
                flash[:notice] = "You are not authorized for this action. Please log back in and try again."
                redirect_to 'session/destroy'
            end
            
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
