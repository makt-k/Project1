module ApplicationHelper
  require 'open-uri'
  def show
    if params[:term] == nil
      doc = Nokogiri::XML(open("http://www.vam.ac.uk/api/xml/museumobject/"))
      id = doc.xpath("//primary_image_id")
      string = id.inner_text
      keys = string.scan(/.{1,10}/)
      url = keys.map{ |key| key[0..-5]}
      @sources = keys.zip(url).map {|key, url| "http://media.vam.ac.uk/media/thira/collection_images/#{url}/#{key}.jpg"}
      @desc = doc.xpath("//descriptive_line")
    else
      doc = Nokogiri::XML(open("http://www.vam.ac.uk/api/xml/museumobject/?q=#{params[:term]}&images=1"))
      id = doc.xpath("//primary_image_id")
      string = id.inner_text
      keys = string.scan(/.{1,10}/)
      url = keys.map{ |key| key[0..-5]}
      @sources = keys.zip(url).map {|key, url| "http://media.vam.ac.uk/media/thira/collection_images/#{url}/#{key}.jpg"}
      @desc = doc.xpath("//descriptive_line")
    end
  end
end
