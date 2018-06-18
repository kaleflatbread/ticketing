class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def show
    find_employee
  end

  def create
    @employee = Employee.create(employee_params)
  end

  def edit
    find_employee
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
  end

  def destroy
    find_employee.destroy
  end

  private

    def find_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :title)
    end

end
