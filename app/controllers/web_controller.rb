class WebController < ApplicationController
  def index
    gon.GoogleMapKey = ENV['GOOGLE_MAP_KEY']
  end
end
