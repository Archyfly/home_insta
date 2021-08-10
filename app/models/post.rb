class Post < ApplicationRecord
  #include ImageUploader::Attachment[:image]

  belongs_to :user
  has_many :comments
  has_many :photos

  validates :title, :body, presence: true
end
