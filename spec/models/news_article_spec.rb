require 'rails_helper'

describe NewsArticle, type: :model do
  describe 'instance methods' do
    it 'can be intialized with article JSON' do
      article_json = ApplicationHelper.single_article
      article = NewsArticle.new(article_json)
      expect(article.source).to eq(article_json[:source])
      expect(article.author).to eq(article_json[:author])
      expect(article.title).to eq(article_json[:title])
      expect(article.description).to eq(article_json[:description])
      expect(article.url).to eq(article_json[:url])
      expect(article.url_to_image).to eq(article_json[:urlToImage])
      expect(article.published_at).to eq(article_json[:publishedAt])
      expect(article.content).to eq(article_json[:content])
    end
  end
end
