#
class AddHomeCourseSlopeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :home_course_slope, :integer
  end
end
