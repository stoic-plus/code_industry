class Topic < ApplicationRecord
  validates_presence_of :name

  has_many :articles
  belongs_to :user, foreign_key: :moderator_id
end
