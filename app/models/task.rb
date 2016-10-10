class Task < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 255 }

  belongs_to :user
  has_many :comments, dependent: :destroy
end
