class NewsFacade
  def self.get_articles(query)
    articles_json = NewsService.everything_search(query)[:articles]
    articles_json.reduce([]) do |return_articles, article_json|
      return_articles.push(NewsArticle.new(article_json))
    end
  end
end
