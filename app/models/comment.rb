class Comment < ActiveRecord::Base
  validates :comment, presence: true, length: { maximum: 20 }

  belongs_to :task
  belongs_to :user
end
