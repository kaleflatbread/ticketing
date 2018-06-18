class CreateEmployeeProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_projects do |t|
      t.integer :employee_id
      t.integer :project_id

      t.timestamps
    end
  end
end
