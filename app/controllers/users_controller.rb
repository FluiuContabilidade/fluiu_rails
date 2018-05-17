class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:edit]
  before_action :set_user, only: [:add_tax_files, :edit, :show, :files, :tax_files, :add_das]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
    if params[:user] == nil
      flash[:danger] = 'Um erro ocorreu. Operação não realizada.'
      redirect_to '/users/index'
      return
    end

    @user.update_attributes(user_params)
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
  end

  def tax_files
  end

  def add_tax_files
  end

  def set_user
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:das_file, :fgts, :inss, :fau, :tributary_sub, :payment_installments)
    end
end
