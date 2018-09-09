require 'net/http'
require 'json'

class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :destroy]
  before_action :set_user

  # GET /favourites
  # GET /favourites.json
  def index
    @favourites = @user.favourites
  end

  # GET /favourites/new
  def new
    @favourite = @user.favourites.build
  end

  # POST /favourites
  # POST /favourites.json
  def create
    @favourite = @user.favourites.new(
                                      user_id: params[:user_id],
                                      picture_id: params[:picture_id]
                                      )

    respond_to do |format|
      if @favourite.save
        format.html { redirect_to user_favourites_path }
      else
        format.html { redirect_to user_path(params[:user_id]) }
        puts @favourite.errors.full_messages
      end
    end

  end

  # DELETE /favourites/1
  # DELETE /favourites/1.json
  def destroy
    @favorite = @user.favourites.find(params[:id])
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_to user_favourite_path, notice: 'Favourite was successfully destroyed.' }
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

  def set_favourite
    @favourite = Favourite.find(params[:id])
  end
end
