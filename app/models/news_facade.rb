class NewsFacade
  def self.get_articles(query)
    articles_json = NewsService.everything_search(query)[:articles]
    articles_json.reduce([]) do |return_articles, article_json|
      if relevant_article?(article_json, query)
        return_articles.push(NewsArticle.new(article_json))
      end
      return_articles
    end
  end

  private

  def self.relevant_article?(article_json, query)
    [:title, :description, :content].each do |attribute|
      return true if article_json[attribute] =~ /#{Regexp.quote(query)}/i
    end
    return false
  end
end
