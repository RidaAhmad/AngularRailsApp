class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :access_token, :username, :thumb_url

  has_many :tasks
end
