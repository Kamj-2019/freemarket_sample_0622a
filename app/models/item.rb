class Item < ApplicationRecord
  include AASM

  aasm do
    # 状態の定義
    state :waiting, :initial => true
    state :wip, :done

    # イベントの定義
    event :run do
      # 遷移の定義
      transitions :from => :waiting, :to => :wip
    end

    event :finish do
      transitions :from => :wip, :to => :done
    end

    event :wait do
      transitions :from => [:wip, :done], :to => :waiting
    end
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item_images
  belongs_to :user
  has_many :users, through: :users_items
  has_many :users, through: :likes
  belongs_to :category
  belongs_to :size
  belongs_to :status
  belongs_to :brand, optional: true
  belongs_to :delivery_fee_payer
  belongs_to :delivery_method
  belongs_to :prefecture
  belongs_to :shipping_day

  accepts_nested_attributes_for :item_images
end
