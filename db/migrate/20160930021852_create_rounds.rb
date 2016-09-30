#
class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :course
      t.date :date
      t.integer :rating
      t.integer :slope
      t.integer :par
      t.integer :score
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
