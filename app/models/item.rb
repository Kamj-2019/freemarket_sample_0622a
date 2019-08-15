class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item_images
  belongs_to :user
  has_many :users, through: :users_items
  has_many :users, through: :likes
  belongs_to :category
  belongs_to :size
  belongs_to :status
  belongs_to :brand, optional: true
  belongs_to_active_hash :delivery_fee_payer
  belongs_to :delivery_method
  belongs_to :prefecture
  belongs_to :shipping_day
end
