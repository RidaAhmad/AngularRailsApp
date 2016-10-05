class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :generate_access_token!

  def generate_access_token!
    begin
      self.access_token = Devise.friendly_token
    end while self.class.exists?(access_token: access_token)
  end
end
