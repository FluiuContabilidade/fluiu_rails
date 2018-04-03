class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to '/users/index'
  end


end
