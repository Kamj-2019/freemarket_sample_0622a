class SizesCategory < ApplicationRecord
  belongs_to_active_hash :size
  belongs_to_active_hash :category
end
