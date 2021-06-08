class CreateMovieComments < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_comments do |t|
      t.integer :user_id
      t.integer :movie_id
      t.string :comment

      t.timestamps
    end
  end
end
