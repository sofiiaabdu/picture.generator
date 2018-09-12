require 'json'
require 'net/http'

class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = current_user.pictures.all
    @favourites = current_user.favourites.build
  end

  def pictures
    @all_pictures = Picture.all
  end

  def show
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to user_url(current_user.id) }
    end
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
