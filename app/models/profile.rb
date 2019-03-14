class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_cats, dependent: :destroy 
  has_many :categories, through: :profile_cats, dependent: :destroy 

  has_one :technical, dependent: :destroy 
  has_one :weighting, dependent: :destroy 

  def goals
    categories.where(stamp: "goal")
  end

  def socials
    categories.where(stamp: "social")
  end
  
  def main_socials_name
    categories.where(stamp: 'social', category_id: nil).map { |c| c.name }
  end

  def goals_name
    goals.map { |c| c.name }
  end

  def sub_socials_name
    where.not(category_id: nil).map { |c| c.name }
  end
end
