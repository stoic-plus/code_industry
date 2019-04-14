require 'rails_helper'

describe NewsFacade, type: :facade do
  context '.articles' do
    it 'returns article objects from NewsService given search string' do
      expect(NewsService).to receive(:everything_search).with("spacex").and_return(ApplicationHelper.article_search_return)
      articles = NewsFacade.get_articles("spacex")
      expect(articles.count).to eq(1)
      expect(articles.first).to be_a(NewsArticle)
    end
  end
end
