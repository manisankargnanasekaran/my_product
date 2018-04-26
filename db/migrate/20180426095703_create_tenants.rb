class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :tenant_name
      t.string :tenant_code
      t.string :tenant_location
      t.boolean :is_active, default: :false
      t.datetime :deleted_at
      t.string :tenant_key
      t.belongs_to :contact, foreign_key: true
      t.belongs_to :address, foreign_key: true
      t.belongs_to :social_network, foreign_key: true

      t.timestamps
    end
  end
end
