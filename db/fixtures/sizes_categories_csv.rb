require 'csv'

csv = CSV.read('db/fixtures/sizes_categories.csv')
csv.each do |size|
  id = size[0]
  size_id = size[1]
  category_id = size[2]

  SizesCategory.seed do |s|
    s.id = id
    s.size_id = size_id
    s.category_id = category_id
  end
end