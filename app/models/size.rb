class Size < ActiveHash::Base
  field :size
  create id: 1, size: 'S'
  create id: 2, size: 'M'
  create id: 3, size: 'L'
  create id: 4, size: '25.0'
  create id: 5, size: '26.0'
  create id: 6, size: '27.0'

  has_many :items
end