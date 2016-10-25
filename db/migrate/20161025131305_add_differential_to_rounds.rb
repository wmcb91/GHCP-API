#
class AddDifferentialToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :differential, :float
  end
end
