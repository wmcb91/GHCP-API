class Profile < ActiveRecord::Base
  validates :given_name, presence: true
  validates :surname, presence: true
  validates :home_course, presence: true
  validates :home_course_slope
  has_many :rounds, dependent: :destroy
  belongs_to :user
end
