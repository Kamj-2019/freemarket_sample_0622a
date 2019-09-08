class ItemImage < ApplicationRecord
  belongs_to :item

  #mount_uploader :image_url, ImageUploader
end
