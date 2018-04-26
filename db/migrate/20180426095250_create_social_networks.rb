class CreateSocialNetworks < ActiveRecord::Migration[5.1]
  def change
    create_table :social_networks do |t|
      t.string :facebook
      t.string :google_plus
      t.string :skype
      t.string :twiter
      t.string :linked_in

      t.timestamps
    end
  end
end
