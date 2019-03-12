class Category < ApplicationRecord
  belongs_to :category, optional: true
  has_many :categories, dependent: :destroy

  has_many :profile_cats
  has_many :profiles, through: :profile_cats, dependent: :destroy
  validates :name, uniqueness: true

  def self.main_socials
    where(stamp: 'social', category_id: nil).map { |c| c.name }
  end

  def self.goals
    where(stamp: 'goal').map { |c| c.name }
  end

  def self.sub_socials
    where.not(category_id: nil).map { |c| c.name }
  end

end
