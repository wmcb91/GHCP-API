class Profile < ActiveRecord::Base
  validates :given_name, presence: true
  validates :surname, presence: true
  validates :dob, presence: true
  validates :state, presence: true
  has_many :rounds, inverse_of: :profile, dependent: :destroy
end
