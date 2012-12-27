require 'open-uri'
require 'feed-abstract'
class SmugMugAtom
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def items
    url_handle = open(@url)
    f = FeedAbstract::Feed.new(url_handle)
    converted_items = []
    f.items.each do |item|
      converted_items << SmugMugItemConverter.convert(item)
    end
    converted_items
  end

  private

  class SmugMugItemConverter
    def self.convert(item)
      { img_url: self.make_url(item.guid) }
    end

    def self.make_url(url)
      url.gsub!(/\/Th\//,'/X2/')
      url.gsub!(/\-Th\.jpg/,'-X2.jpg')
    end
  end

end
