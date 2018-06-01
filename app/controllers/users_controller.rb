class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:update, :opening_status_change_post]
  before_action :set_user, only: [:add_tax_files, :update, :show, :files, :tax_files, :add_das, :opening_status_change]
  load_and_authorize_resource

  def index
    @users = User.all
  end
# .sort  {|x,y| x.item_date[0..1] <=> y.item_date[0..1]}
  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
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

  # GET opening_status_change
  ## Open Opening Status Change Form
  def opening_status_change
  end

  # POST opening_status_change
  ## Submit Opening Status Change Form
  def opening_status_change_post
    @user.request_opening_status_change params[:message]
    redirect_to "/home"
    flash[:success] = 'Operação realizada com sucesso! Fluiu Contabilidade irá contactar você em breve!'
  end


  private
    def user_params
      params.require(:user).permit(:das_file, :fgts, :inss, :fau, :tributary_sub, :payment_installments)
    end
end
