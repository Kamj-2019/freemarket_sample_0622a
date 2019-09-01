class UserDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :user_id, uniqueness: true

  belongs_to :user, optional: true
  belongs_to :prefecture
end
