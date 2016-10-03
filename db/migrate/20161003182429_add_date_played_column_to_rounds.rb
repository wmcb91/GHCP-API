class AddDatePlayedColumnToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :date_played, :date
  end
end
