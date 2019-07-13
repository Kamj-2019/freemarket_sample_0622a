class DeliveryMethod < ActiveHash::Base
  field :delivery_method
  create :id => 1, :delivery_method => '未定'
  create :id => 2, :delivery_method => 'らくらくメルカリ便'
  create :id => 3, :delivery_method => 'ゆうメール'
  create :id => 4, :delivery_method => 'レターパック'
  create :id => 5, :delivery_method => '普通郵便(定形、定形外)'
  create :id => 6, :delivery_method => 'クロネコヤマト'
  create :id => 7, :delivery_method => 'ゆうパック'
  create :id => 8, :delivery_method => 'クリックポスト'
  create :id => 9, :delivery_method => 'ゆうパケット'

  has_many :items
end