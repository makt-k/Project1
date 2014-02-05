class ExposController < ApplicationController

  before_action :get_user

  def index
    if params[:search]
      @expos = Expo.search(params[:search])
    else
      @expos = Expo.all
    end
  end

  def new
    @expo= Expo.new
  end

  def create
    @user.expos << Expo.create!(expo_params)
    redirect_to :root
  end

  def home
    render :layout => false
  end

  def show
    @expo = Expo.find(params[:id])
  end

  private

  def expo_params
    params.require(:expo).permit(:title, :body, :art, :url, :tag, :user_id, :id, :created_at)
  end

  def get_user
    @user= User.find(params[:user_id]) if params.key?(:user_id)
  end

end



