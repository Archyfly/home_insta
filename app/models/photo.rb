class Photo < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :post
  validates :title, :image_data, presence: true
end
