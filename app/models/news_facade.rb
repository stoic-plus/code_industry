class NewsFacade
  def self.get_articles(query, sort=:desc)
    articles_json = NewsService.everything_search(query)[:articles]
    convert_to_objects(articles_json, query, sort)
  end

  private

  def self.sort_articles(articles, sort)
    return articles.sort{ |a, b| b.published_at <=> a.published_at } if sort == :desc
    return articles.sort{ |a, b| a.published_at <=> b.published_at } if sort == :asc
  end

  def self.relevant_article?(article_json, query)
    [:title, :description, :content].each do |attribute|
      return true if article_json[attribute] =~ /#{Regexp.quote(query)}/i
    end
    return false
  end

  def self.convert_to_objects(articles_json, query, sort)
    articles = articles_json.reduce([]) do |return_articles, article_json|
      if relevant_article?(article_json, query)
        return_articles.push(NewsArticle.new(article_json))
      end
      return_articles
    end
    sort_articles(articles, sort)
  end
end
