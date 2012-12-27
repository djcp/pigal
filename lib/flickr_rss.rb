require 'open-uri'
require 'feed-abstract'
class FlickrRss
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def items
    url_handle = open(@url)
    f = FeedAbstract::Feed.new(url_handle)
    converted_items = []
    f.items.each do |item|
      converted_items << FlickrRssConverter.convert(item)
    end
    converted_items
  end

  private

  class FlickrRssConverter
    def self.convert(item)
      { img_url: self.get_url_from_summary(item.summary) }
    end

    def self.get_url_from_summary(description)
      description.match(/img src="([^"]+)"/)[1].gsub(/_m\./, '_b.')
    end
  end
end
