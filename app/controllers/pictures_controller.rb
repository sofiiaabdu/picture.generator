require 'net/http'
require 'json'

class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @picture_url = 'https://hlfppt.org/wp-content/uploads/2017/04/placeholder.png'
    # @picture_url = Faker::Avatar.image

    uri = URI(@picture_url)
    @pictures = Net::HTTP.get_response(uri)
  end
end
