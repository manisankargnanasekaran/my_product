class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :salutation
      t.string :first_name
      t.string :last_name
      t.boolean :is_active,  default: :true
      t.datetime :deleted_at
      t.string :user_name
      t.string :user_key
      t.belongs_to :contact, foreign_key: true
      t.belongs_to :address, foreign_key: true
      t.belongs_to :social_network, foreign_key: true
      t.belongs_to :role, foreign_key: true
      t.belongs_to :login_detail, foreign_key: true
      

      t.timestamps
    end
  end
end
