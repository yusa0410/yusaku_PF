class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :user_id
      t.string :title
      t.string :image_id
      t.integer :date
      t.float :rate
      t.string :review

      t.timestamps
    end
  end
end
