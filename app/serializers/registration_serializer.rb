class RegistrationSerializer < ActiveModel::Serializer
  attributes :id, :email, :access_token, :username
end
