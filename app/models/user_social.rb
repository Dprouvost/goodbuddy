class UserSocial < ApplicationRecord
  belongs_to :user
  belongs_to :social
end
