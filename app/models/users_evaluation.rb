class UsersEvaluation < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :evaluation
end
