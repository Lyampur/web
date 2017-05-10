class CreateCinemaMovies < ActiveRecord::Migration
  def change
    create_table :cinema_movies do |t|

      t.timestamps null: false
    end
  end
end
