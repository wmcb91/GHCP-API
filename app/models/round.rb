class Round < ActiveRecord::Base
  validates :course, presence: true
  validates :date_played, presence: true
  validates :rating, presence: true
  validates :slope, presence: true
  validates :par, presence: true
  validates :score, presence: true
  belongs_to :profile
end
