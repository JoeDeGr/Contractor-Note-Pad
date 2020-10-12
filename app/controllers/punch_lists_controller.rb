class PunchListsController < ApplicationController
    before_action :this_list
    skip_before_action :this_list, only: [:create]
    before_action :authorized_user
    skip_before_action :authorized_user, only: [:create]
    
    def create
        @punch_list = PunchList.new(punch_list_params)
        @project = Project.find(params[:punch_list][:project_id])
        if @punch_list.valid?
            @punch_list.save
            redirect_to punch_list_path(@punch_list)
        else
            render 'projects/show'
        end
    end

    def show
        @workers = @punch_list.uniq_workers
        @project = Project.find(@punch_list.project_id)
    end

    def edit
        @project = @punch_list.project
    end

    def update
        @punch_list.update(punch_list_params)
        redirect_to punch_list_path(@punch_list)
    end

    def destroy
        @project = @punch_list.project
        @punch_list.tasks.each do |t|
            t.materials.each do |m|
                m.destroy
            end
            t.destroy
        end
        @punch_list.destroy

        redirect_to project_path(@project)
    end

    private
    def punch_list_params
        params.require(:punch_list).permit(:name, :project_id)
    end
    def this_list
        @punch_list = PunchList.find(params[:id])
    end
    
    def authorized_user
        if !(@punch_list.user == current_user)
            flash[:notice] = "You are not authorized for this action. Please log back in and try again."
            session.destroy
            redirect_to root_path
        end
    end
end
