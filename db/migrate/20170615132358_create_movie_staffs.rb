class CreateMovieStaffs < ActiveRecord::Migration
  def change
    create_table :movie_staffs do |t|
      t.references :movie, index: true, foreign_key: true, null: false
      t.references :staff, index: true, foreign_key: true, null: false
      t.string :role, null: false

      t.timestamps null: false
    end
  end
end
