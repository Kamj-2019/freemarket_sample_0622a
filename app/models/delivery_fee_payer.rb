class DeliveryFeePayer < ActiveHash::Base
  field :delivery_fee_payer
  create id: 0, delivery_fee_payer: '---'
  create id: 1, delivery_fee_payer: '送料込み(出品者負担)'
  create id: 2, delivery_fee_payer: '着払い(購入者負担)'
end