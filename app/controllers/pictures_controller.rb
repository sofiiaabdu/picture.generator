require 'json'
require 'net/http'

class PicturesController < ApplicationController
  before_action :authenticate_user!, except: :index

  # GET /pictures
  # GET /pictures.json
  def index
    @all_pictures = if params[:filter] == 'user' && current_user
        current_user.pictures
      else
        Picture.all
      end
  end

  def show
  end

  def destroy
    # @picture = Picture.find(params[:picture_id])
    picture =  Picture.find_by(id: params[:picture_id], user_id: current_user.id)
    picture.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
    end
  end
end
