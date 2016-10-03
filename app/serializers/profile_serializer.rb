class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :surname, :state, :home_course
  belongs_to :user
  has_many :rounds
end
