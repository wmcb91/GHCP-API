#
class RemoveDateFromRounds < ActiveRecord::Migration
  def change
    remove_column :rounds, :date, :date
  end
end
