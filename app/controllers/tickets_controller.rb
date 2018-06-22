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
    @all_employees = Employee.all
    @all_projects = Project.all
    @ticket = Ticket.new(ticket_params)
    if @ticket.valid?
      
      @ticket.save
      new_ticket = @ticket.project.employee_projects.build(project_id: @ticket.project_id, employee_id: @ticket.employee_id)
      new_ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end


  def edit
    find_ticket
    @all_employees = Employee.all
    @all_projects = Project.all

  end

  def update
    @ticket = Ticket.find(params[:id])
    @all_employees = Employee.all
    @all_projects = Project.all
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    find_ticket.destroy
  end

  private

    def find_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:name, :description, :employee_id, :project_id, :complete, :due_date)
    end

end
