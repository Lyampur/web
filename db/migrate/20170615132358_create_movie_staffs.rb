class CreateMovieStaffs < ActiveRecord::Migration
  def change
    create_table :movie_staffs do |t|
      t.references :movie, index: true, foreign_key: true, null: false
      t.references :staff, index: true, foreign_key: true, null: false
      t.string :role

      t.index [:movie_id, :staff_id], unique: true

      t.timestamps null: false
    end
  end
end
