class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :surname, :dob, :state, :rounds
  belongs_to :user
  has_many :rounds
end
