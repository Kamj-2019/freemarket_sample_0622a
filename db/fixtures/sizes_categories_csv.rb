require 'csv'

csv = CSV.read('db/fixtures/sizes_categories.csv')
csv.each do |size|
  size_id = size[0]
  category_id = size[1]

  SizesCategory.seed do |s|
    s.size_id = size_id
    s.category_id = category_id
  end
end