class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :surname, :home_course, :rounds
  belongs_to :user
  has_many :rounds
end
