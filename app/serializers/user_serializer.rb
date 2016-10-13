class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :profiles
  has_many :profiles
end
