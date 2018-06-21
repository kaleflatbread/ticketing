class Employee < ApplicationRecord

  has_many :employee_projects
  has_many :projects, through: :employee_projects
  has_many :tickets

  validates :name, :title, :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true

  has_secure_password

  def find_manager
    @manager = self.manager_id
    Employee.find_by(id: @manager)
  end

  def find_manager_name
    find_manager.name
  end

  def find_manager_title
    find_manager.title
  end

  def list_managers_employees
    Employee.where(:manager_id => self.id)
  end

  def number_of_tickets_completed
    self.tickets.where(:complete => true).count
  end

  def number_of_outstanding_tickets
    self.tickets.where(:complete => false).count
  end

  def sort_tickets
    #modify to only show completed tickets!!
    self.tickets.order(:due_date)
  end

  def next_ticket_due
    sort_tickets.first
  end





end
