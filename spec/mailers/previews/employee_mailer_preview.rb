# Preview all emails at http://localhost:3000/rails/mailers/employee_mailer
class EmployeeMailerPreview < ActionMailer::Preview
  def welcome_mail_preview
    EmployeeMailer.welcome_email(Employee.first)
  end
end
