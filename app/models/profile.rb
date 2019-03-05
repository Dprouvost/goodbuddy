class Profile < ApplicationRecord
  validates :nickname, :picture, presence: true
  belongs_to :user
end
