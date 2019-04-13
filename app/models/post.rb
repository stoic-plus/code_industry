class Post < ApplicationRecord
  has_many :comments
  belongs_to :topic
  belongs_to :user

  validates_presence_of :title, :author, :content

  belongs_to :user
  belongs_to :topic
end
