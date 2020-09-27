class MaterialsController < ApplicationController
    
    def new
    end
    
    def create
        @material = Material.new(material_params)
        @material.price = @material.material_price_parse
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
        @material = Material.find(params[:id])
        @task = @material.task
    end

    def update
        @material = Material.find(params[:id])
        @material.update(material_params)
        if @material.valid?
            redirect_to material_path(@material)
        else
            render @material.show
        end
    end

    def destroy
        @material = Material.find(params[:id])
        @task = @material.task
        @material.destroy
        redirect_to task_path(@task)
    end

    private

    def material_params
        params.require(:material).permit(:name, :description, :price, :date, :task_id)
    end

    def material_price_params
        params.require(:material).permit(:price)
    end
end
