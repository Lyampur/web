class CreateCinemas < ActiveRecord::Migration
  def change
    create_table :cinemas do |t|
      t.string :name, null: false
      t.text :address, null: false
      

      t.timestamps null: false
    end
  end
end
