class SmugMugAtom
  def initialize(url)
    @url = url
  end

  def items
    content = open(@url).read
    doc = Nokogiri.parse(content)
    output = []
    doc.search('id').each do|node|
      output << { img_url: make_url(node.text) }
    end
    output
  end

  private

  def make_url(image_url)
    image_url.gsub!(/\/Th\//,'/X2/')
    image_url.gsub!(/\-Th\.jpg/,'-X2.jpg')
  end

end
