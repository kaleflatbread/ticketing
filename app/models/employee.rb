class Employee < ApplicationRecord
  # belongs_to :manager
  has_many :employee_projects
  has_many :projects, through: :employee_projects
  has_many :tickets
  validates :name, :title, presence: true
  validates :username, uniqueness: true


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
end
