class CreateJoinTableCinemaMovie < ActiveRecord::Migration
  def change
    create_join_table :cinemas, :movies do |t|
      t.index [:cinema_id, :movie_id]
      # t.index [:movie_id, :cinema_id]
    end
  end
end
