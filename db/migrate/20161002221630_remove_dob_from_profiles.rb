#
class RemoveDobFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :dob, :date
  end
end
