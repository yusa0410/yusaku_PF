class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :profile_image_id
      t.string :introduction
      t.integer :user_id

      t.timestamps
    end
  end
end
