#
class AddHomeCourseToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :home_course, :string
  end
end
