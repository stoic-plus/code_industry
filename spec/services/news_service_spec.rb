require 'rails_helper'

# {
# "status": "ok",
# "totalResults": 5080,
# -"articles": [
# -{
#    -"source": {
#      "id": null,
#      "name": "Dailydot.com"
#    },
#    "author": "Ellen Ioanes",
#    "title": "Silk Road 2.0 founder sentenced to more than 5 years in prison",
#    "description": "Thomas White was originally arrested in 2014. The post Silk Road 2.0 founder sentenced to more than 5 years in prison appeared first on The Daily Dot.",
#    "url": "https://www.dailydot.com/debug/silk-road-2-thomas-white/",
#    "urlToImage": "https://www.dailydot.com/wp-content/uploads/2019/04/dark-web-silk-road.jpg",
#    "publishedAt": "2019-04-13T21:35:16Z",
#    "content": "Thomas White, who launched the infamous Silk Road 2.0 site shortly after the original was taken down by the Federal Bureau of Investigation in 2013, was sentenced to 64 months in prison at Liverpool Crown Court on Friday, the BBC reports.\r\nWhite was known by … [+1498 chars]"
#  },

describe NewsService, type: :service do
  it 'returns JSON given a search query' do
    json = NewsService.single_search("spacex")

    expect(json).to have_key(:status)
    expect(json).to have_key(:totalResults)
    expect(json).to have_key(:articles)
    expect(json[:articles]).to have_key(:source)
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
