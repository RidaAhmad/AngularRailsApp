class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: { maximum: 25 }

  before_create :generate_access_token!

  has_many :tasks
  has_attached_file :attachment, styles: { large: '450x400!', medium: '250x250!', thumb: '100x100!' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/

  def generate_access_token!
    begin
      self.access_token = Devise.friendly_token
    end while self.class.exists?(access_token: access_token)
  end

  def thumb_url
    self.attachment.url(:thumb)
  end
end
