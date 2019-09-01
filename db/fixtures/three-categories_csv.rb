require 'csv'

csv = CSV.read('db/fixtures/three-categories.csv')
csv.each do |category|
  id = category[0]
  first_category_id = category[1]
  second_category_id = category[2]
  third_category_id = category[3]

  Category.seed do |s|
    s.id = id
    s.first_category_id = first_category_id
    s.second_category_id = second_category_id
    s.third_category_id = third_category_id
  end
end