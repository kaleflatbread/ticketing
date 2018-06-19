class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    find_employee
  end

  def new
    @employee = Employee.new
    @all_managers = Manager.all
  end

  def create
    @employee = Employee.create(employee_params)
    @all_managers = Manager.all
    redirect_to @employee
  end

  def edit
    find_employee
    @all_managers = Manager.all
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    @all_managers = Manager.all
    redirect_to @employee
  end

  def destroy
    find_employee.destroy
  end

  private

    def find_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :title, :manager_id)
    end

end
