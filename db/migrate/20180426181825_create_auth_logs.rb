class CreateAuthLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :auth_logs do |t|
      t.string :auth_token
      t.datetime :deleted_at
      t.boolean :is_active, default: :true


      t.timestamps
    end
  end
end


