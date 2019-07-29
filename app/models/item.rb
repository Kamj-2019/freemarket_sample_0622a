class Item < ApplicationRecord
  has_many :item_images
  belongs_to :user
  has_many :users, through: :users_items
  has_many :users, through: :likes
  belongs_to :category
  belongs_to_active_hash :size
  belongs_to_active_hash :status
  belongs_to_active_hash :brand
  belongs_to_active_hash :delivery_fee_payer
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
end
