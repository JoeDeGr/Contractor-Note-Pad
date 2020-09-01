class ProjectsController < ApplicationController

    def new
    end

    def create
        @project = Project.new(project_params)
        binding.pry
        
        if @project.valid?
            binding.pry
            @project.save
            redirect_to project_path(@project)
        else
            render "new"
        end
    end

    private

    def project_params
        params.require(:project).permit(:name, :user_id)
    end
end
