class User < ApplicationRecord

  include ImageUploader::Attachment[:image]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :follower_follows, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_follows, source: :follower

  has_many :following_follows, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followings, through: :following_follows, source: :following


  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, length: { minimum: 2 }
  validates :info, length: { maximum: 300 }

end
