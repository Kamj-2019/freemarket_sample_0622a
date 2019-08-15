class Status < ActiveHash::Base
  field :status
  create id: 1, status: '新品、未使用'
  create id: 2, status: '未使用に近い'
  create id: 3, status: '目立った傷や汚れなし'
  create id: 4, status: 'やや傷や汚れあり'
  create id: 5, status: '傷や汚れあり'
  create id: 6, status: '全体的に状態が悪い'
end