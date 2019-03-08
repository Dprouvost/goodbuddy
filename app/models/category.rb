class Category < ApplicationRecord
  belongs_to :category, optional: true
  has_many :categories, dependent: :destroy

  has_many :profile_cats
  has_many :profiles, through: :profile_cats, dependent: :destroy
  validates :name, uniqueness: true
end
