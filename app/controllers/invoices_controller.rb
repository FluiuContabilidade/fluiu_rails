class InvoicesController < ApplicationController
  include InvoicesHelper
  skip_before_action :verify_authenticity_token, :only => [:add_monthly_accounting_info]

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

    if invoice.save
      invoice.update_month_field
    end
  end

  def individual_report
    @invoice = Invoice.find(params[:id])
  end

  def monthly_invoices
    @month = params[:month]
  end

  def monthly_invoices_by_type
    @invoices = []
    Invoice.where(user_id: params[:id], month: params[:month]).each do |i|
      if params[:type] == 'out'
        @invoices.push(i) if Invoice.entry_type?(i.invoice_file.read, User.find(params[:id]).cnpj) == true
      else
        @invoices.push(i) if Invoice.entry_type?(i.invoice_file.read, User.find(params[:id]).cnpj) == false
      end
    end
  end

end
