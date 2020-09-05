class TasksController < ApplicationController
    def new
    end

    def create
        @task = Task.new(task_params)
        @punch_list = 
    end

    def show
    end

    private

    def task_params
        params.require(:task).include(:name, :punch_list_id)
    end
end