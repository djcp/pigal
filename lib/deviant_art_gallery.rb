class DeviantArtGallery
  def self.can_handle?(url)
    url.match /backend\.deviantart.+gallery/
  end

  def initialize(url)
    @url = url
  end

  def items
    content = open(@url).read
    doc = Nokogiri.parse(content)
    output = []
    doc.search('//media:content[contains(@medium, "image")]').each do|node|
      output << { img_url: node['url'] }
    end
    output
  end

end
