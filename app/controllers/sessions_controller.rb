class SessionsController < ApplicationController

    #before_action :require_login #authenticate here

    def new
    end

    def create

        @manager = Manager.find_by(username: manager_params[:username])
        if @manager && @manager.authenticate(manager_params[:password])
          session[:manager_id] = @manager.id


    end


    def destroy
        session.delete :name
        redirect_to '/login'
    end



    private

    def employee_params
      params.require(:employee).permit(:username, :password)
    end

    def require_login
      #redirects if not logged in
    end


end
