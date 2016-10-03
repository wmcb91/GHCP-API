class RoundSerializer < ActiveModel::Serializer
  attributes :id,
             :course,
             :date_played,
             :rating,
             :slope,
             :par,
             :score,
             :profile_id
end
