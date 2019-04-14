module ApplicationHelper
  def self.single_article
    {
      :source=>{:id=>"engadget", :name=>"Engadget"},
      :author=>"Richard Lawler",
      :title=>"Watch SpaceX's Falcon Heavy launch and triple booster landing at 8PM",
      :description=>"Last year SpaceX finally launched its massive Falcon Heavy rocket for the first time. While the plan to return all three of its boosters fell just short of success, today the company will try again, and as usual you can watch a live stream of the attempt righ…",
      :url=>"https://www.engadget.com/2019/04/10/falcon-heavy-spacex-launch/",
      :urlToImage=>"https://o.aolcdn.com/images/dims?thumbnail=1200%2C630&quality=80&image_uri=https%3A%2F%2Fo.aolcdn.com%2Fimages%2Fdims%3Fcrop%3D5185%252C3098%252C0%252C0%26quality%3D85%26format%3Djpg%26resize%3D1600%252C956%26image_uri%3Dhttps%253A%252F%252Fs.yimg.com%252Fos%252Fcreatr-images%252F2019-04%252F7d0e4350-5bd1-11e9-afdf-77f7fbb2aa81%26client%3Da1acac3e1b3290917d92%26signature%3D06ad30bb9ffdb666590047003eff03e6d0d5c9f7&client=amp-blogside-v2&signature=8b1d0c4dcc151f7af0101934cfc734698c3c5a0b",
      :publishedAt=>"2019-04-10T20:48:00Z",
      :content=>"Last year SpaceX finally launched its massive Falcon Heavy rocket for the first time. While the plan to return all three of its boosters fell just short of success, today the company will try again, and as usual you can watch a live stream of the attempt righ… [+587 chars]"
   }
  end

  def self.article_search_return
    {
    status: "ok",
    totalResults: 32,
    articles: [
        {
            source: {
                id: 'null',
                name: "Space.com"
            },
            author: "Elizabeth Howell",
            title: "Can robots build a Moon base for astronauts? Japan hopes to find out.",
            description: "Japan's space agency wants to create a moon base with the help of robots that can work autonomously, with little human supervision.",
            url: "http://www.space.com/japan-robots-build-moon-base.html",
            urlToImage: "https://static.foxnews.com/foxnews.com/content/uploads/2019/04/afdphxajn2rfe3jR7Xvx2D.jpg",
            publishedAt: "2019-04-08T14:05:24Z",
            content: "Japan's space agency wants to create a moon base with the help of robots that can work autonomously, with little human supervision.\r\nThe project, which has racked up three years of research so far, is a collaboration between the Japan Aerospace Exploration Ag… [+3353 chars]"
        }
      ]
    }
  end
end
