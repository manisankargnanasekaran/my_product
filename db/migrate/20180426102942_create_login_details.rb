class CreateLoginDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :login_details do |t|
      t.string :email
      t.string :password_digest
      t.string :is_active, default: :true
      t.datetime :deleted_at
      t.integer :login_role
      t.belongs_to :tenant, foreign_key: true

      t.timestamps
    end
  end
end
