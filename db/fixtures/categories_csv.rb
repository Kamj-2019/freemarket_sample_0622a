require 'csv'

csv = CSV.read('db/fixtures/categories.csv')
csv.each do |category|
  first_category_id = category[0]
  second_category_id = category[1]
  third_category_id = category[2]

  Category.seed do |s|
    s.first_category_id = first_category_id
    s.second_category_id = second_category_id
    s.third_category_id = third_category_id
  end
end