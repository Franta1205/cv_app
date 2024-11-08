class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  has_one :cv, dependent: :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first
    user ||= User.create(email: data["email"],
                         password: Devise.friendly_token[0, 20])

    Rails.logger.info("User data( id: #{user.id}, email: #{user.email})")
    user
  end
end
