class PunchListsController < ApplicationController
    def new
    end

    def create
        @punch_list = PunchList.new(punch_list_params)
        @project = Project.find(params[:punch_list][:project_id])
        if @punch_list.valid?
            @punch_list.save
            redirect_to punch_list_path(@punch_list)
        else
            # render 'projects/#{@project.id}'
            render 'new'
        end
    end

    def show
        @punch_list = PunchList.find(params[:id])
        @workers = @punch_list.uniq_workers
        @project = Project.find(@punch_list.project_id)
        @user = User.find(@project.user_id)
    end

    private
    def punch_list_params
        params.require(:punch_list).permit(:name, :project_id)
    end
end
