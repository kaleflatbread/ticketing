class Manager < ApplicationRecord
  has_many :employees
  has_many :projects, through: :employees
  # do we need a relationship for tickets???
end
