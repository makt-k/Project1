class SearchImagesController < ApplicationController

  def create
    redirect_to "#{request.referer.split('?').first}?term=#{params[:term]}"
  end
end
