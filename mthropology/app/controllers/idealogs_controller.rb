class IdealogsController < ApplicationController
 before_action :get_user

  def index
    @idealogs = Idealog.includes(:user).all
  end

  def new
    @idealog = Idealog.new
  end

  def create
    @user.idealogs << Idealog.create!(idealog_params)
    redirect_to user_path(@user.id)
  end

  def show
    @idealog = Idealog.find(params[:id])
  end

  def edit
    @idealog = Idealog.find(params[:id])
  end

  def update
    @idealog = Idealog.find(params[:id])
    @idealog.update_attributes(idealog_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @idealog = Idealog.find(params[:id])
    @idealog.destroy
    redirect_to user_path(@user.id)
  end

  private

  def idealog_params
    params.require(:idealog).permit(:title, :body, :tag, :user_id, :id, :created_at)
  end

  def get_user
    @user= User.find(params[:user_id]) if params.key?(:user_id)
  end

end


