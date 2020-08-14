class Image < ApplicationRecord
  belongs_to :item, optional: true

  validates :item_image, presence: true
end
