class MaterialsController < ApplicationController
    
    def new
    end
    
    def create
        @material = Material.new(material_params)
        @task = Task.find(@material.task_id)
        if @material.valid?
            @material.save
            redirect_to material_path(@material)
        else
            render 'new'
        end
    end

    def show
        @material = Material.find(params[:id])
        @task = Task.find(@material.task_id)
        @punch_list = PunchList.find(@task.punch_list_id)
        @project = Project.find(@punch_list.project_id)
        @user = User.find(@project.user_id)
    end
    
    def edit
    end

    private

    def material_params
        params.require(:material).permit(:name, :description, :price, :date, :task_id)
    end
end
