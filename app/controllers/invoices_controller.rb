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

    invoice.save
    # byebug
  end

end
