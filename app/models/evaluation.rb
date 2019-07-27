class Evaluation < ActiveHash::Base
  field :evaluation
  create id: 1, evaluation: '良い'
  create id: 2, evaluation: '普通'
  create id: 3, evaluation: '悪い'

  has_many :users_evaluations
  has_many :users, through: :users_evaluations
end