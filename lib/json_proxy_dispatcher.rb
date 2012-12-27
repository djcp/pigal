require './lib/smug_mug_atom'
require './lib/flickr_rss'
require './lib/null_strategy'

class JsonProxyDispatcher
  attr_accessor :urls

  def initialize(urls = [])
    @urls = urls
  end

  def as_json
    items = []
    @urls.each do|url|
      strategy = UrlStrategyFactory.strategy(url)
      items << strategy.items
    end
    JSON.generate(items.flatten.compact)
  end

  private

  class UrlStrategyFactory
    def self.strategy(url)
      if url.match /smugmug\.com.+atom10/
        SmugMugAtom.new(url)
      elsif url.match /api\.flickr\.com.+rss/
        FlickrRss.new(url)
      else
        NullStrategy.new(url)
      end
    end
  end

end
