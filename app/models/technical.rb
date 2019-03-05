class Technical < ApplicationRecord
  has_one :user, through: :user_technicals

end
