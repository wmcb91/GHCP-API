class RoundSerializer < ActiveModel::Serializer
  attributes :id, :course, :date, :rating, :slope, :par, :score, :profile_id
end
