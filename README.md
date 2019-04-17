# ScienceFollow

### About

Project meant to represent a typical _take home challenge_ - built over two days

[__Deployed Link__ ](https://limitless-springs-57672.herokuapp.com/)

Disregard the repo name - _we pivotted_. This application is a type of forum.

__Articles__

Users can follow certain topics and receive the latest news articles for that topic. They can favorite articles for later viewing.


__Topics and Posts__

* Topics have their own page with posts on it. Users can write posts about these topics. Other users can comment on these posts.

* Posts show up on a topics page based on how many upvotes they have.

* Topics have moderators so users can have many topics in two ways: the topics they follow and those they moderate

#### Landing Page

![landing](/landing.png)

#### Schema

![schema](/schema.png)

## Getting Started with this repo

### Prerequisites

You'll need the following:

__Software__
* Ruby (2.4.5)
* [Bundler](https://bundler.io/)

### Installing

Run the following:
```
$ git clone https://github.com/stoic-plus/code_industry.git
$ bundle install
```

### Running Test Suite

(After cloning down repo)

```
cd code_industry
rspec
```

## API, Service, and Facade

Uses the [__News API__](https://newsapi.org/)

Service and Facade are more singular in their overall responsibilities
* Service deals solely with retrieving JSON from the API
* Facade deals with instantiating Ruby objects

__Service__

Uses some default parameters to simplify search and exact match on the search query to increase likelihood of relevant results
  * Article must contain _exact_ query (according to API documentation)

Inside `NewsService`

Base connection
```
def self.conn
  Faraday.new(url: 'https://newsapi.org/v2') do |faraday|
    faraday.adapter  Faraday.default_adapter
  end
end
```
Searching method
```
def self.everything_search(search_query, sortBy='relevance', from=nil, to=nil)
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
```

__Facade__

Facade adds functionality not present in the API.
  * Sorting by additional parameters (by date in addition to by relevance)
  * Further sorting out for relevance

```
def self.sort_articles(articles, sort)
  return articles.sort{ |a, b| b.published_at <=> a.published_at } if sort == :desc
  return articles.sort{ |a, b| a.published_at <=> b.published_at } if sort == :asc
end

def self.relevant_article?(article_json, query)
  [:title, :description, :content].each do |attribute|
    return true if article_json[attribute] =~ /#{Regexp.quote(query)}/i
  end
  return false
end
```
* Method to optionally sort either newest - oldest or oldest - newest
* `relevant_article?` checks a current article for relevancy by checking each of those attributes. If the search query is found in any of them - then the article is relevant

## Built With

* Ruby on Rails
* [Rspec](http://rspec.info/) - Testing Framework
* [__News API__](https://newsapi.org/)

## Developers

* **Ricardo Ledesma** - [Personal Website](https://www.ricardoledesma.tech/)

## Contributing

if you are interested in helping: make a PR with your changes to
  * https://github.com/stoic-plus/code_industry
