class UsersController < ApplicationController
  before_filter :authenticate_user!
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
    redirect_to user_path(@user.id)
    else
    render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :id)
  end

end
