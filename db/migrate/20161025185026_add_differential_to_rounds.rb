#
class AddDifferentialToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :differential, :decimal, precision: 4, scale: 1
  end
end
