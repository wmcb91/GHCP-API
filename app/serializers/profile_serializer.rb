class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :surname, :dob, :state, :rounds
  has_many :rounds
end
