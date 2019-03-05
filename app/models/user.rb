class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable
      
  has_many :user_goals
  has_many :goals, through: :user_goals

  has_many :user_socials
  has_many :socials, through: :user_socials

  has_many :user_technicals
  has_many :technicals, through: :user_technicals
end
