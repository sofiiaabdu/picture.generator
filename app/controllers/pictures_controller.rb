require 'json'
require 'net/http'

class PicturesController < ApplicationController
  before_action :authenticate_user!, except: :index

  # GET /pictures
  # GET /pictures.json
  def index
=begin
    @all_pictures = if params[:filter] == 'user' && current_user
        current_user.pictures
      else
        Picture.all
      end
=end
    if current_user
      @all_pictures = current_user.pictures
    else
      @all_pictures = Picture.all
    end
  end

  def destroy
    picture =  Picture.find_by(id: params[:id], user_id: current_user.id)
    picture.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
    end
  end
end
