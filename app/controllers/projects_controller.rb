class ProjectsController < ApplicationController

    def new
    end

    def create
        @project = Project.new(project_params)
        
        if @project.valid?
            @project.save
            redirect_to project_path(@project)
        else
            render "new"
        end
    end

    def show
        @project = Project.find(params[:id])
    end

    private

    def project_params
        params.require(:project).permit(:name, :user_id)
    end
end
