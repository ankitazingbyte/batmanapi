class User < ActiveRecord::Base
  # Include default devise modules.
  after_create :generate_auth_token
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable

  def generate_auth_token
    token = SecureRandom.hex
    self.update_columns(auth_token: token)
    token
	end 
end
