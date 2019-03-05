class Social < ApplicationRecord
  belongs_to :category
  has_one :user, through: :user_socials

end
