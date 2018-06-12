class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:update, :opening_status_change_post]
  before_action :set_user, only: [:edit, :add_tax_files, :update, :show, :files, :tax_files, :add_das, :opening_status_change]
  load_and_authorize_resource

  ## GET users/:filter
  ## Get All Users, filter indicates user role.
  def index
    @filter = params[:filter]

    if @filter == "admin"
      @users = User.admin_role.all
    else
      @users = User.client_role.all
    end
  end
# .sort  {|x,y| x.item_date[0..1] <=> y.item_date[0..1]}
  def new
    @filter = params[:filter]
    @user = User.new
  end

  def show
  end

  # GET user/:filter
  ## Edit user
  def edit
    @filter = params[:filter]
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

  ## GET /
  # Returns index of user with files
  def index_files
    @users = User.client_role.all
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

  # GET historic
  ## Show all users client role
  def historic
  end


  private
    def user_params
      params.require(:user).permit(:name, :das_file, :fgts, :inss, :fau, :tributary_sub, :payment_installments, :email, :company, :cnpj, :cpf, :telephone, :opening_status,  :protocol, :earnings_type, :earnings_range, :role)
    end
end
