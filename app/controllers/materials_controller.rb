class MaterialsController < ApplicationController
    before_action :this_material
    skip_before_action :this_material, only: [:new, :create]
    before_action :authorized_user
    skip_before_action :authorized_user, only: [:new, :create]
    
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
        @task = Task.find(@material.task_id)
        @punch_list = PunchList.find(@task.punch_list_id)
        @project = Project.find(@punch_list.project_id)
    end
    
    def edit
        @task = @material.task
    end

    def update
        @material.update(material_params)
        if @material.valid?
            redirect_to material_path(@material)
        else
            render @material.show
        end
    end

    def destroy
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

    def this_material
        @material = Material.find(params[:id])
    end
    
    def authorized_user
        if !(@material.user == current_user)
            flash[:notice] = "You are not authorized for this action. Please log back in and try again."
            session.destroy
            redirect_to root_path
        end
    end
end
