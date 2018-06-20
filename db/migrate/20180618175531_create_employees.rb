class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :title
      t.integer :manager_id
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
