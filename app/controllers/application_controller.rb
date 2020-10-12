class ApplicationController < ActionController::Base
    before_action :require_login
    before_action :current_user
   
private
    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def current_user
        @user = (User.find(session[:user_id]) || User.new)
    end

    def authorized_user
        if self.user == current_user
            @user = self.user
        else
            flash[:notice] = "You are not authorized for this action."
            session.destroy
            redirect_to '/login'
        end
    end

end
