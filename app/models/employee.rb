class Employee < ApplicationRecord
  belongs_to :manager
  has_many :employee_projects
  has_many :projects, through: :employee_projects
  has_many :tickets#, through: :projects
end
