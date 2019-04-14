class NewsArticle
  attr_reader :source,
              :author,
              :title,
              :description,
              :url,
              :url_to_image,
              :published_at,
              :content
  def initialize(attributes)
    @source = attributes[:source]
    @author = attributes[:author]
    @title = attributes[:title]
    @description = attributes[:description]
    @url = attributes[:url]
    @url_to_image = attributes[:urlToImage]
    @published_at = attributes[:publishedAt]
    @content = attributes[:content]
  end
end
