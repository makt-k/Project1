require 'rubygems'
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'sinatra'
require 'sinatra/reloader'


get "/" do
  doc = Nokogiri::XML(open("http://www.vam.ac.uk/api/xml/museumobject/"))
  id = doc.xpath("//primary_image_id")
  string = id.inner_text
  @keys = string.scan(/.{1,10}/)
  @url = @keys.map{ |key| key[0..-5]}
  @sources = @keys.zip(@url).map {|key, url| "http://media.vam.ac.uk/media/thira/collection_images/#{url}/#{key}.jpg"}
  erb :collect
end
