class DocumentsController < ApplicationController
  before_action :set_variables, only: [:das_page, :balancete_page]

  def set_variables
    @user = User.find(params[:id])
    @document = Document.new
  end

  def das_page
  end

  def add_das
    doc = Document.create(document_params)
    redirect_to '/agent/fiscal'
    flash[:success] = 'DAS anexada com sucesso.'
  end

  def balancete_page
  end

  def add_balancete
    doc = Document.create(document_params)
    redirect_to '/agent/fiscal'
    flash[:success] = 'Balancete anexada com sucesso.'
  end


  private
    def document_params
      params.require(:document).permit(:name, :file, :user_id)
    end

end
