class AnalyticsController < ApplicationController
  def index
    @employees = Employee.all
    @projects = Project.all
  end

end
