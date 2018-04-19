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
    @invoices = InvoicesService.group_invoice_by_entry_type(params[:id], params[:month], params[:type])
    if params[:filter] == 'dif_origin'
      @invoices = @invoices.reject {|invoice| Invoice.is_a_local_invoice?(invoice.invoice_file.read) == true }
    end
  end

end
