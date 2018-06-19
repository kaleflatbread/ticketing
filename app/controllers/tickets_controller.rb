class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @all_employees = Employee.all
    @all_projects = Project.all
  end

  def show
    find_ticket
  end

  def create
    @ticket = Ticket.create(ticket_params)
    @all_employees = Employee.all
    @all_projects = Project.all
    redirect_to @ticket
  end

  def edit
    find_ticket
    @all_employees = Employee.all
    @all_projects = Project.all
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(ticket_params)
    @all_employees = Employee.all
    @all_projects = Project.all
    redirect_to @ticket
  end

  def destroy
    find_ticket.destroy
  end

  private

    def find_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:name, :description, :employee_id, :project_id, :complete)
    end

end
