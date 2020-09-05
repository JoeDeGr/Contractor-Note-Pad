class TasksController < ApplicationController
    def new
    end

    def create
        @task = Task.new(task_params)
        @punch_list = PunchList.find(params[:task][:punch_list_id])
        if @task.valid?
            @task.save
            redirect_to task_path(@task)
        else
            render 'new'
        end
    end

    def show
        @task = Task.find(params[:id])
        @punch_list = PunchList.find(@task.punch_list_id)
        @project = Project.find(@punch_list.project_id)
        @user = User.find(@project.user_id)
    end

    private

    def task_params
        params.require(:task).permit(:name, :punch_list_id)
    end

    # def new_task_punch_list_id
    #     params.require(:task).permit(:punch_list_id)
    # end
end