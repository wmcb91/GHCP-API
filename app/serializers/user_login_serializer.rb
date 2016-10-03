class UserLoginSerializer < ActiveModel::Serializer
  attributes :id, :email, :token
  has_many :profiles

  def token
    Rails.application.message_verifier(:signed_token).generate(object.token)
  end
end
