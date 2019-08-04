class Category < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :first_category
  belongs_to :second_category
  belongs_to :third_category
end
