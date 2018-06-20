class Ticket < ApplicationRecord
  
  belongs_to :project
  belongs_to :employee

  validates :name, :description, :project_id, :employee_id, presence: true

  def find_project_description
    self.project.description
  end

  def find_project_name
    self.project.name.titleize
  end

  def find_project_name_and_description
    "#{find_project_name} — #{find_project_description}"
  end

  def find_manager
    @manager = self.employee.manager_id
    Employee.find_by(id: @manager)
  end

  def find_manager_name
    find_manager.name
  end

  def find_manager_title
    find_manager.title
  end

  def find_logged_in_employee
    @id = session[:employee_id]
    @employee_array = Employee.where(:manager_id => @id)
  end


end
