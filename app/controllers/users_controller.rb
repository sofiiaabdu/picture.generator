require 'net/http'
require 'json'
require 'ffaker'

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :new]
  before_action :admin_authorize, only: [:index]

  # GET /users
  # GET /users.json
  def index
    @count = User.all.count
    @count_male = User.male.count
    @count_female = User.female.count
    @count_other = User.other.count
    @average = User.average(:age)
    @minimum = User.minimum(:age)
    @maximum = User.maximum(:age)

    @users = filter(params[:first], params[:city], params[:min], params[:max], params[:male], params[:female])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user.id.to_s == params[:id]
      random_picture_generator
    end

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

    private

    def filter(first = nil, city = nil, min = nil, max = nil, male = nil, female = nil)
      if first
        User.name_order(first)
      elsif min && max
        User.age_filter(max, min)
      elsif city
        User.city_order(city)
      elsif male
        User.male
      elsif female
        User.female
      else
        User.all
      end
    end

    def random_picture_url
      url = FFaker::Avatar.image
      uri = URI.parse(url)
      # url_faker = url.slice('http://loremflickr.com')

      response = Net::HTTP.get_response(uri)

      if response.code == '301'
        response = Net::HTTP.get_response(URI.parse(response.header['location']))
        url = response.header['location']
      end

     URI.parse(url).to_s
    end

    def random_picture_generator
      @url = random_picture_url

      picture = Picture.new(url: @url, user_id: params[:id])
      picture.save
    end

    def set_user
      if current_user.admin?
        @user = User.find(params[:id])
      else
        @user = current_user
      end
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :sex, :age, :about,
                                   address_attributes: [:zip, :city, :street, :house_member])
    end

    def admin_authorize
      return if current_user.try(:admin?)
      redirect_to pictures_path, alert: 'Access denied!'
    end
end
