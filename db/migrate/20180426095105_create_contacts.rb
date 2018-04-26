class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :mobile1
      t.string :mobile2
      t.string :fax
      t.boolean :is_primary, default: :true

      t.timestamps
    end
  end
end
