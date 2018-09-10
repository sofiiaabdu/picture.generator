require 'json'
require 'net/http'

class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :destroy]
  before_action :set_user, only: [:index]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = @user.pictures.all
    @favourites = @user.favourites.build
  end

  def pictures
    @all_pictures = Picture.all
  end

  def show
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to user_url(params[:user_id]) }
    end
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
