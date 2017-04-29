class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :genre, null: false, limit: 20
      t.string :duration, null: false
      t.string :country, null: false
      t.string :company, null: false
      t.integer :age_rating, null: false

      t.timestamps null: false
    end
  end
end
