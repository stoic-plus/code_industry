class Article < ApplicationRecord
  belongs_to :topic
  validates_presence_of :title,
                       :author,
                       :source,
                       :description,
                       :url,
                       :url_to_image,
                       :published_at,
                       :context
end
