require 'csv'

csv = CSV.read('db/fixtures/tb_item_images.csv')
csv.each do |image|
  id = image[0]
  image_url = image[1]
  item_id = image[2]
  created_at = image[3]
  updated_at = image[4]

  ItemImage.seed do |s|
    s.id = id
    s.image_url = image_url
    s.item_id = item_id
    s.created_at = created_at
    s.updated_at = updated_at
  end
end