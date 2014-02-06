class UsersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user.id = current_user.id
    @user = User.new
  end

  def create
    @user.id = current_user.id
    @user = User.new(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :id)
  end

end
