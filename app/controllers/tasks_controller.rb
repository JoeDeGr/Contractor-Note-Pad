class TasksController < ApplicationController
    before_action :this_task
    skip_before_action :this_task, only: [:create]
    before_action :authorized_user
    skip_before_action :authorized_user, only: [:create]

    def create
        @task = Task.new(task_params)
        @punch_list = PunchList.find(params[:task][:punch_list_id])
        @project = @punch_list.project
        if @task.valid?
            @task.save
            redirect_to task_path(@task)
        else
            render '/punch_lists/show'
        end
    end

    def show
        @punch_list = PunchList.find(@task.punch_list_id)
        @project = Project.find(@punch_list.project_id)
        @user = User.find(@project.user_id)
    end

    def edit
        @punch_list = PunchList.find(@task.punch_list_id)
        @project = Project.find(@punch_list.project_id)
        @user = User.find(@project.user_id)
    end

    def update
        @worker = Worker.find(params[:task][:workers])
        @task.workers << @worker
        @task.save
        redirect_to task_path(@task)
    end

    def destroy
        @punch_list = @task.punch_list
        @task.materials.each do |m|
            m.destroy
        end
        @task.destroy
        redirect_to punch_list_path(@punch_list)
    end

    def remove_worker
        @task = Task.find(params[:id])
        @worker = Worker.find(params[:worker])
        @task.workers.delete(@worker)
        redirect_to task_path(@task)
    end

    private

    def task_params
        params.require(:task).permit(:name, :punch_list_id, :description)
    end

    def this_task
        @task = Task.find(params[:id])
    end
    
    def authorized_user
        if !(@task.user == current_user)
            flash[:notice] = "You are not authorized for this action. Please log back in and try again."
            session.destroy
            redirect_to root_path
        end
    end
end