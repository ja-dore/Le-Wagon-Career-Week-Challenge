require 'json'
require 'open-uri'

class PagesController < ApplicationController

  def museum
    # receives the data by #home by a click on the map
    # the url for the mapbox API respons
    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?proximity=#{params[:lng]},#{params[:lat]}&limit=7&access_token=#{ENV['MAPBOX_API_KEY']}"
    input_mapbox = JSON.parse(URI.open(url).read)

    # restore the input in a new output (sorted by postcode and name)
    output = {}
    input_mapbox["features"].each do |museum|
      postcode = museum["context"][0]["text"]
      name = museum["text"]
      output.include?(postcode) ? output[postcode] << name : output[postcode] = [name]
    end
    # return the new output towards the view and converted into a JSON
    @output = output.to_json
  end
end
