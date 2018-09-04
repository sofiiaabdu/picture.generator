require 'json'
require 'net/http'

class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    user = User.find(params[:user_id])
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to user_path, notice: 'Picture was successfully destroyed.' }
    end
  end


  ### ????????????????
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
