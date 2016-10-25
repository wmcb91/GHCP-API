class Round < ActiveRecord::Base
  validates :course, presence: true
  validates :date_played, presence: true
  validates :rating, presence: true
  validates :slope, presence: true
  validates :par, presence: true
  validates :score, presence: true
  belongs_to :profile

  def self.default_scope
    order(date_played: :desc, created_at: :desc)
  end

  def self.differential
    (:score - :rating) * 113 / :rating
  end
end
