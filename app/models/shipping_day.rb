class ShippingDay < ActiveHash::Base
  field :shipping_day
  create :id => 1, :shipping_day => '1~2日で発送'
  create :id => 2, :shipping_day => '2~3日で発送'
  create :id => 3, :shipping_day => '4~7日で発送'

  has_many :items
end