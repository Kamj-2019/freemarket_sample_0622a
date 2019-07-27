class Category < ApplicationRecord
  belongs_to_active_hash :first_category
  belongs_to_active_hash :second_category
  belongs_to_active_hash :third_category
end
