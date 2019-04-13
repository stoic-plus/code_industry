class Comment < ApplicationRecord
  validates_presence_of :title, :content, :author

  belongs_to :user
  belongs_to :post
end
