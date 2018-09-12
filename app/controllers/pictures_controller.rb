require 'json'
require 'net/http'

class PicturesController < ApplicationController
  before_action :authenticate_user!, except: :all_pictures

  # GET /pictures
  # GET /pictures.json
  def index
    @all_pictures = Picture.all
  end

  def show
    @pictures = current_user.pictures.all
    @favourites = current_user.favourites.build
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
    end
  end
end
