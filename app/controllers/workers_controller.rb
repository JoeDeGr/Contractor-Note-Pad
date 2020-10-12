class WorkersController < ApplicationController
    before_action :this_worker
    skip_before_action :this_worker, only: [:create]
    before_action :authorized_user
    skip_before_action :authorized_user, only: [:create]

    def new
    @user = User.find(params[:id])
    end
        
    def create
        @worker = Worker.new(worker_params)
        if @worker.valid?
            @worker.save
            redirect_to worker_path(@worker)
        else
            render '/users/show'
        end
    end

    def show
        @worker = Worker.find(params[:id])
    end

    def edit
        @worker = Worker.find(params[:id])
    end

    def update
        @worker = Worker.find(params[:id])
        if params[:worker][:tasks]
            @task = Task.find(params[:worker][:tasks])
            @worker.tasks << @task    
        else
            @worker.update(worker_params)
        end
        redirect_to worker_path(@worker)
    end

    def remove_task
        @worker = Worker.find(params[:id])
        @task = Task.find(params[:task])
        @worker.tasks.delete(@task)   
        redirect_to worker_path(@worker)
    end 

    def destroy
        @worker = Worker.find(params[:id])
        @worker.destroy
        redirect_to user_path(@user)
    end

    private

    def worker_params
        params.require(:worker).permit(:name, :user_id)
    end

    def this_worker
        @worker = Worker.find(params[:id])
    end
    
    def authorized_user
        if !(@worker.user == current_user)
            flash[:notice] = "You are not authorized for this action. Please log back in and try again."
            session.destroy
            redirect_to root_path
        end
    end
end
