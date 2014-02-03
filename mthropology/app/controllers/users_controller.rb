class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(author_params)
    if @user.save!
    redirect_to user_path
    else
    render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def author_params
    params.require(:user).permit(:name, :email, :id)
  end

end
