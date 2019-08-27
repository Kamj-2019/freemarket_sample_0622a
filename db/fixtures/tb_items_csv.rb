require 'csv'

csv = CSV.read('db/fixtures/tb_items.csv')
csv.each do |item|
  id = item[0]
  item_title = item[1]
  description = item[2]
  category_id = item[3]
  size_id = item[4]
  brand_id = item[5]
  status_id = item[6]
  delivery_fee_payer_id = item[7]
  delivery_method_id = item[8]
  prefecture_id = item[9]
  shipping_day_id = item[10]
  price = item[11]
  user_id = item[12]
  created_at = item[13]
  updated_at = item[14]

  Item.seed do |s|
    s.id = id
    s.item_title = item_title
    s.description = description
    s.category_id = category_id
    s.size_id = size_id
    s.brand_id = brand_id
    s.status_id = status_id
    s.delivery_fee_payer_id = delivery_fee_payer_id
    s.delivery_method_id = delivery_method_id
    s.prefecture_id = prefecture_id
    s.shipping_day_id = shipping_day_id
    s.price = price
    s.user_id = user_id
    s.created_at = created_at
    s.updated_at = updated_at
  end
end