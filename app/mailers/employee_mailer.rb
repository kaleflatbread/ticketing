class EmployeeMailer < ApplicationMailer

  def welcome_email
    byebug
    @employee = params[:employee]
    @url  = 'http://localhost:3000/sessions/new'
    mail(to: @employee.email, subject: 'Welcome to My Awesome Site')
  end

end
