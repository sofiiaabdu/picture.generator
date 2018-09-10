require 'net/http'
require 'json'

class UsersController < ApplicationController
  include UsersHelper
  include UserAccess

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: :index

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    random_picture_generator

    @pictures = Picture.pictures_by_user(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    @user.address = Address.new
    @picture = Picture.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Thanks for joining us! :)' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.address.destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Aww.. we are sad you\'ve left us' }
      format.json { head :no_content }
    end
  end

  def random_picture_url
    url = Faker::LoremFlickr.image
    uri = URI.parse(url)
    url_faker = url.slice('http://loremflickr.com')

    response = Net::HTTP.get_response(uri)

    if response.code == '301'
      response = Net::HTTP.get_response(URI.parse(response.header['location']))
      url = response.header['location']
    end

    url_faker + URI.parse(url).to_s
  end

  def random_picture_generator
    @url = random_picture_url

    picture = Picture.new(url: @url, user_id: params[:id])
    picture.save
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :sex, :age, :about,
                                   address_attributes: [:zip, :city, :street, :house_member])
    end

    def authorize_admin
      return if current_user.try(:admin?)
      redirect_to root_path, notice: 'Access denied!'
    end

    def user_id
      params[:id]
    end
  end
