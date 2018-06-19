class ApplicationController < ActionController::Base

  def current_user
    session[:name] ||= params[:name]
  end

  private

  def authenticate!
    #authenticate something here
  end
end
