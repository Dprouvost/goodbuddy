class Profile < ApplicationRecord
  validates :nickname, :picture, presence: true
end
