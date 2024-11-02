class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    if user
      user.update(
        # Optional: You can create a migration for users to add GitHub username and name to the user instance.
        # github_username: data['nickname'],
        # name: data['name'],
        email: data['email']
      )
    else
      user = User.create(
        # Optional: You can create a migration for users to add GitHub username and name to the user instance.
        # github_username: data['nickname'],
        # name: data['name'],
        email: data['email'],
        password: Devise.friendly_token[0,20]
      )
    end
    # Optional: Uncomment for adding avatar image from github, make sure you have a cloudinary API_KEY in your .env
    # user.avatar.attach(io: URI.open(data['image']), filename: 'avatar.jpg', content_type: 'image/jpg')
    user
  end
end
