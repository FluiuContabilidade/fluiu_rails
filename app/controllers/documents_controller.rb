class DocumentsController < ApplicationController

  def das_page
    @user = User.find(params[:id])
    @document = Document.new
  end

  def add_das
    doc = Document.create(document_params)
    redirect_to '/agent/fiscal'
    flash[:success] = 'DAS anexada com sucesso.'
  end


  private
    def document_params
      params.require(:document).permit(:name, :file, :user_id)
    end

end
