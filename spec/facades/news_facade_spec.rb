require 'rails_helper'

describe NewsFacade, type: :facade do
  context '.articles' do
    before :each do
      expect(NewsService).to receive(:everything_search).with("spacex").and_return(ApplicationHelper.article_search_return)
    end
    it 'returns article objects from NewsService given search string' do
      articles = NewsFacade.get_articles("spacex")
      expect(articles.first).to be_a(NewsArticle)
    end
    it 'removes articles that are not relevant from NewsService returned json' do
      expect(ApplicationHelper.article_search_return[:articles].count).to eq(6)
      articles = NewsFacade.get_articles("spacex")
      expect(articles.count).to eq(3)
    end
  end
end
