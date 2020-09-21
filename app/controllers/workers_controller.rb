class WorkersController < ApplicationController

    def new
    @user = User.find(params[:id])
    end
        
    def create
        @worker = Worker.new(worker_params)
        @user=User.find(worker_params[:user_id])
        if @worker.valid?
            @worker.save
            redirect_to worker_path(@worker)
        else
            render 'new'
        end
    end

    def show
        @worker = Worker.find(params[:id])
        @user = @worker.user
    end

    def edit
        @worker = Worker.find(params[:id])
        @user = @worker.user
    end

    def update
        @worker = Worker.find(params[:id])
        if params[:worker][:tasks]
            binding.pry
            @task = Task.find(params[:worker][:tasks])
            @worker.tasks << @task    
        else
            binding.pry
            @worker.update(worker_params)
        end
        redirect_to worker_path(@worker)
    end

    # def "/workers/#{:id}"
    #     raise params.inspect
    # end
    private

    def worker_params
        params.require(:worker).permit(:name, :user_id)
    end
end
