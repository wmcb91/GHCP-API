class RemoveStateColumnFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :state, :string
  end
end
