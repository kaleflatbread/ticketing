class EmployeeProject < ApplicationRecord
  belongs_to :project
  belongs_to :employee
end
