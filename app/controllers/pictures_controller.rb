require 'net/http'
require 'json'

class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    url = Faker::LoremFlickr.image
    uri = URI.parse(url)

    url_faker = url.slice('http://loremflickr.com')

    response = Net::HTTP.get_response(uri)

    if response.code == '301'
      response = Net::HTTP.get_response(URI.parse(response.header['location']))
      url = response.header['location']
    end

    @url = url_faker + URI.parse(url).to_s
  end
end
