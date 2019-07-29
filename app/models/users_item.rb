class UsersItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  #belongs_to :payjp
end
