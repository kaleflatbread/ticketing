class SessionsController < ApplicationController
  include SessionHelper
  skip_before_action :authenticate!, :only => [:new, :create]

  def new
    @errors = []
    @employee = Employee.new
  end

  def create
    @employee = Employee.find_by(username: employee_params[:username])

    if @employee && @employee.authenticate(employee_params[:password])
      helpers.log_in_employee!(@employee.id)
      redirect_to @employee
    else
      @employee = Employee.new(username: employee_params[:username])
      @errors = ["Username and/or password are incorrect"]
      render :new
    end
  end

  def destroy
    helpers.log_out_employee!
    redirect_to '/sessions/new'
  end

  private

  def employee_params
    params.require(:employee).permit(:username, :password)
  end

end
