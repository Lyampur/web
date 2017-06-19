class CreateCinemaMovies < ActiveRecord::Migration
  def change
    create_table :cinema_movies do |t|
      t.references :cinema, index: true, foreign_key: true, null: false
      t.references :movie, index: true, foreign_key: true, null: false

      t.index [:movie_id, :cinema_id], unique: true

      t.timestamps null: false
    end
  end
end
