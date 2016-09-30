class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :given_name
      t.string :surname
      t.date :dob
      t.string :state

      t.timestamps null: false
    end
  end
end
