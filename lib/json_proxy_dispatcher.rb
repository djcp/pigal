require './lib/smug_mug_atom'
require './lib/flickr_rss'
require './lib/deviant_art_gallery'
require './lib/null_strategy'

class JsonProxyDispatcher
  attr_accessor :urls

  def initialize(urls = [])
    @urls = urls
  end

  def as_json
    items = []
    @urls.each do|url|
      strategy = best_strategy_for(url)
      items << strategy.items
    end
    JSON.generate(items.flatten.compact)
  end

  def best_strategy_for(url)
    strategy = self.class.strategies.find{|strategy|
      strategy.can_handle? url
    } || NullStrategy
    strategy.new(url)
  end

  def self.strategies
    @strategies
  end

  def self.register_image_source_strategy(klass)
    @strategies = [] if @strategies.nil?
    @strategies << klass
  end

end

JsonProxyDispatcher.register_image_source_strategy SmugMugAtom
JsonProxyDispatcher.register_image_source_strategy DeviantArtGallery
JsonProxyDispatcher.register_image_source_strategy FlickrRss
