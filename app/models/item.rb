class Item < ApplicationRecord
  include AASM

  aasm :column => 'aasm_state' do
    # 状態の定義
    state :waiting, :initial => true #デフォルト値の指定
    state :wip, :done

    # waiting-出品中
    # wip-取引中
    # done-売却済

    # イベントの定義
    event :run do
      # 遷移の定義（出品中→取引中）
      transitions :from => :waiting, :to => :wip
    end

    event :finish do
      # 遷移の定義（取引中→売却済）
      transitions :from => :wip, :to => :done
    end

    event :wait do
      # 遷移の定義（キャンセル：→出品中への戻し）
      transitions :from => [:wip, :done], :to => :waiting
    end
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item_images, dependent: :destroy
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
