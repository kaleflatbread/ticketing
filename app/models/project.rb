class Project < ApplicationRecord
  has_many :tickets
  has_many :employee_projects
  has_many :employees, through: :employee_projects
  validates :name, :description, presence: true

  def count_tickets
    self.tickets.count
  end

  def tickets_completed
    self.tickets.where(:complete => true)
  end

  def number_of_tickets_completed
    tickets_completed.count
  end

  def tickets_outstanding
    self.tickets.where(:complete => false)
  end

  def number_of_tickets_outstanding
    tickets_outstanding.count
  end

  def percentage_complete
    (number_of_tickets_completed / count_tickets)*100.0.to_s + "%"
  end

  def next_ticket_due
    #add due_date to schema + views
  end



end
