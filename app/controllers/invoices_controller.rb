class InvoicesController < ApplicationController

  def accounting_info
    @user = User.find(params[:id])
  end

  def add_monthly_accounting_info
    params[:attachment][:files].each do |file|
      create_invoice ({user_id: params[:user_id], file: file})
    end
  end

  def create_invoice(invoice_params)
    invoice = Invoice.new(user_id: invoice_params[:user_id])
    invoice.invoice_file = invoice_params[:file]

    if invoice.save?
      flash[:notice] = "Ação Realizada com sucesso!"
      redirect_to "/home"
    else
      flash[:notice] = "Ação falhou."
      redirect_to "/home"
    end
  end

  def monthly_invoices
    invoices = Invoice.where(user_id: params[:id], month: params[:month])
    invoices = InvoicesService.setup_invoice_collection invoices
    warning = Invoice.missing_invoices? invoices

    if warning == true
      @message = "Notas Fiscais faltando."
    else
      @message = "Tudo correto!"
    end

  end

end
