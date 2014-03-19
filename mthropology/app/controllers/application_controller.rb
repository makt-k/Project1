require 'open-uri'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper ApplicationHelper

  before_action :get_remote_images

  def after_sign_in_path_for(resource)
    @user_path
  end

# bad smell: duplicate code
  def get_remote_images
    if params[:term] == nil
      doc = Nokogiri::XML(open("http://www.vam.ac.uk/api/xml/museumobject/"))
      parse_xml(doc)
    else
      doc = Nokogiri::XML(open("http://www.vam.ac.uk/api/xml/museumobject/?q=#{params[:term]}&images=1"))
      parse_xml(doc)
    end
  end

# solution: extract method
  def parse_xml(doc)
    id = doc.xpath("//primary_image_id")
    string = id.inner_text
    keys = string.scan(/.{1,10}/)
    url = keys.map{ |key| key[0..-5]}
    @sources = keys.zip(url).map {|key, url| "http://media.vam.ac.uk/media/thira/collection_images/#{url}/#{key}.jpg"}
    @desc = doc.xpath("//descriptive_line")
  end
end

