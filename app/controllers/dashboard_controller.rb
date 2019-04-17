class DashboardController < ApplicationController
  def index
    @fav_topics = current_user.topics
    @latest_articles = {}
    @fav_topics.each do |topic|
      articles = NewsFacade.get_articles(topic.name)[0..4]
      @latest_articles[topic.name] = articles
    end
  end
end
