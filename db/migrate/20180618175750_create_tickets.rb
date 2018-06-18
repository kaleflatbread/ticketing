class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :description
      t.boolean :complete, default: false
      t.integer :project_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
