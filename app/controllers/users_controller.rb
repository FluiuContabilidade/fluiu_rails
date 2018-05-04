class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    byebug
    user = User.find(params[:id])
    user.update_attributes(user_params)

    redirect_to "/users/index"
    flash[:success] = "Operação Realizada com sucesso!"
  end

  def create
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to '/users/index'
  end

  def invoices_index
    @months = User.find(params[:id]).user_invoice_months
    @id = params[:id]
  end

  def files
    @user = User.find(params[:id])
  end

  def add_das
    @user = User.find(params[:id])
  end

  private
  def user_params
    user_params.permit(:das_file)
  end


end
