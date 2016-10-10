class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id

  has_many :comments
end
