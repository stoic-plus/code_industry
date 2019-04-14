require 'rails_helper'

describe NewsService, type: :service do
  context '.everything_search' do
    it 'returns JSON given a single search query' do
      json = NewsService.everything_search("spacex")
      expect(json).to have_key(:status)
      expect(json).to have_key(:totalResults)
      expect(json).to have_key(:articles)
      expect(json[:articles].first).to have_key(:source)
      expect(json[:articles].first[:source]).to have_key(:id)
      expect(json[:articles].first[:source]).to have_key(:name)
      expect(json[:articles].first).to have_key(:author)
      expect(json[:articles].first).to have_key(:title)
      expect(json[:articles].first).to have_key(:description)
      expect(json[:articles].first).to have_key(:url)
      expect(json[:articles].first).to have_key(:urlToImage)
      expect(json[:articles].first).to have_key(:publishedAt)
      expect(json[:articles].first).to have_key(:content)
    end
  end
end
