class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :role_name
      t.string :role_code
      t.boolean :active_role, default: :true
      t.datetime :delete_at
      t.string :role_key
      t.belongs_to :tenant, foreign_key: true

 
      t.timestamps
    end
  end
end
