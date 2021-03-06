class Post < ApplicationRecord
  #include ImageUploader::Attachment[:image]

  belongs_to :user, required: true
  has_many :comments
  has_many :photos

  validates :title, :body, presence: true
  validates :title, length: { minimum: 5 }
  validates :title, length: { maximum: 30 } #, too_long: "30 characters is the maximum allowed" }
end
