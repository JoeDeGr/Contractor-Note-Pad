class ProjectsController < ApplicationController
    before_action :this_project
    before_action :authorized_user

    def new
    end

    def create
        @project = Project.new(project_params)
        @user = @project.user
        if @project.valid?
            @project.save
            redirect_to project_path(@project)
        else
            render "/users/show"
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

    def destroy
        @project = Project.find(params[:id])
        @user = @project.user
        @project.tasks.each do |t|
            t.materials.each do |m|
                m.destroy
            end
            t.destroy
        end
        @project.punch_lists.each do |p|
            p.destroy
        end
        @project.destroy
        redirect_to user_path(@user)
    end

    private

    def project_params
        params.require(:project).permit(:name, :user_id)
    end

    def this_project
        @project = Project.find(params[:id])
    end
    
    def authorized_user
        if !(@project.user == current_user)
            flash[:notice] = "You are not authorized for this action. Please log back in and try again."
            session.destroy
            redirect_to root_path
        end
    end
end
