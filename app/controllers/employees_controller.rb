class EmployeesController < ApplicationController
  include SessionHelper

  def home
  end

  def index
    @employees = Employee.all
  end

  def show
    find_employee
  end

  def new
    @employee = Employee.new
    @all_managers = Employee.all
    @list_of_managers = Employee.select {|employee| employee.manager_id == nil}
  end

  def create
    @employee = Employee.new(employee_params)
    @all_managers = Employee.all
    @list_of_managers = Employee.select {|employee| employee.manager_id == nil}

    if @employee.valid?
      @employee.save
      byebug
      EmployeeMailer.with(employee: @employee, test: "test").welcome_email.deliver_now
      log_in_employee!(@employee.id)
      redirect_to @employee
    else
      render :new
    end
  end

  def edit
    find_employee
    @all_managers = Employee.all
    @list_of_managers = Employee.select {|employee| employee.manager_id == nil}

  end

  def update
    @employee = Employee.find(params[:id])
    @all_managers = Employee.all
    @list_of_managers = Employee.select {|employee| employee.manager_id == nil}

    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
    find_employee.destroy
  end

  private

    def find_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :title, :manager_id, :email, :username, :password)
    end

end
