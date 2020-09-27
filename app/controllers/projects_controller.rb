class ProjectsController < ApplicationController

    def new
        @project = Project.new
        @user = @project.user
    end

    def create
        @project = Project.new(project_params)
        @user = @project.user
        if @project.valid?
            @project.save
            redirect_to project_path(@project)
        else
            redirect_to user_path(@user)
        end
    end

    def show
        @project = Project.find(params[:id])
    end

    def edit
        @project = Project.find(params[:id])
        @user = @project.user
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        redirect_to project_path(@project)
    end

    private

    def project_params
        params.require(:project).permit(:name, :user_id)
    end
end
