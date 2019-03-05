class Goal < ApplicationRecord
  has_one :user, through: :user_goals
end
