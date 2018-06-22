class AnalyticsController < ApplicationController
  def index
    @employees = Employee.all
    @projects = Project.all
    @tickets = Ticket.all
  end

end
