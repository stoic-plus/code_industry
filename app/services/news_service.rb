class NewsService
  def self.everything_search(search_query, sortBy='relevance', from, to)
    response = conn.get do |req|
      req.url 'everything'
      req.params['q'] = "\"#{search_query}\""
      req.params['from'] = from if from
      req.params['to'] = to if to
      req.params['apiKey'] = ENV['API_KEY']
      req.params['language'] = 'en'
      req.params['sortBy'] = sortBy
    end
    get_json(response.body)
  end

  private

  def self.get_json(response)
    JSON.parse(response, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://newsapi.org/v2') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
