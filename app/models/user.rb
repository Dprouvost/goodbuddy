class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]
  
  has_one :profile, dependent: :destroy
 
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider 
      user.nickname = auth.info.nickname
      user.picture_url = auth.info.image
      user.uid = auth.uid 
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end 
  end 

  # creates profile if not existing
  def profile
    super || Profile.create(user: self) #, nickname: self.nickname, picture: self.picture_url)
    # Profile.technicals = Technical.create(profile_id: self.profile.id, commit_slot: get_commit_slot(self.profile.nickname), github_age: get_age(self.profile.nickname), number_of_projects: get_number_of_projects(self.profile.nickname), total_commits: get_total_commits(self.profile.nickname), followers: get_followers(self.profile.nickname))
  end
end
