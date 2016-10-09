class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :access_token, :username

  has_many :tasks
end
