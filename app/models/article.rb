class Article < ApplicationRecord
  validates_presence_of :title,
                       :author,
                       :source,
                       :description,
                       :url,
                       :url_to_image,
                       :published_at,
                       :context
end
