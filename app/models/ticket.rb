class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :employee

  validates :name, :description, :project_id, :employee_id, presence: true
  # because complete is a boolean, make sure that this validation is working correctly
end
