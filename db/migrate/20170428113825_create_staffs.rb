class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.date :birthday, null: false

      t.timestamps null: false
    end
  end
end
