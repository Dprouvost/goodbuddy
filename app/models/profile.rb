class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_cats, dependent: :destroy 
  has_many :categories, through: :profile_cats, dependent: :destroy 

  has_one :technical, dependent: :destroy 
  has_one :weighting, dependent: :destroy 

end
