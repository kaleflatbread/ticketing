class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :title
      t.integer :manager_id
      t.string :username      

      t.timestamps
    end
  end
end
