class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :authenticate!, except: [:new, :create]

  helper SessionHelper

  def current_user
    session[:name] ||= params[:name]
  end

  def home
  
  end

  private

  def authenticate!
    redirect_to new_session_url unless helpers.logged_in?
  end
end
