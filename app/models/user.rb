class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :username
  validates :email, presence: true, uniqueness: true

  has_many :favorited_articles
  has_many :articles, through: :favorited_articles
  has_many :followed_topics
  has_many :topics, through: :followed_topics
  has_many :posts
end
