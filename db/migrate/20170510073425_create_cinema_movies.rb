class CreateCinemaMovies < ActiveRecord::Migration
  def change
    create_table :cinema_movies do |t|
      t.references :cinema, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true 

      t.timestamps null: false
    end
  end
end
