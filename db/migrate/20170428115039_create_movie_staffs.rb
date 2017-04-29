class CreateMovieStaffs < ActiveRecord::Migration
  def change
    create_table :movie_staffs do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :staff, index: true, foreign_key: true 

      t.string :staff_work
      t.timestamps null: false
    end
  end
end
