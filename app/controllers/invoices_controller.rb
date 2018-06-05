class InvoicesController < ApplicationController
  include InvoicesHelper
  skip_before_action :verify_authenticity_token, :only => [:add_monthly_accounting_info]

  def accounting_info
    @user = User.find(params[:id])
    @accounting_info = AccountingInfo.new()
  end

  def add_monthly_accounting_info
    a = AccountingInfo.new(canceled_invoices: params[:accounting_info][:canceled_invoices],
      paycheck_changes: params[:accounting_info][:paycheck_changes],
      month: Time.now.strftime('%Y-%m'), user_id: current_user.id)
    a.financial_spreadsheet = params[:accounting_info][:financial_spreadsheet]
    a.save

    if params[:attachment] != nil
      params[:attachment][:files].each do |file|
        create_invoice ({user_id: params[:user_id], file: file})
      end
    end

    redirect_to "/home"
    flash[:success] = "Operação Efetuada com Sucesso!"
    # return
  end

  ## GET /get_invoices/user_id
  def get_user_invoices
    user = User.find(params[:id])
    date = DateTime.new(DateTime.now.year, DateTime.now.month - 1, DateTime.now.day)
    @invoices = user.invoices.where month: date.strftime('%Y-%m')

    filename = user.company + DateTime.now.to_s + '.zip'
    temp_file = Tempfile.new(filename)


    ## 05/06/2018
    # FIXME:  This will only work on development environment. Adjust it to work on production and test, S3 needed.
    Zip::File.open(temp_file.path, Zip::File::CREATE) do |zip_file|
      @invoices.each do |f|
         zip_file.add(f.invoice_file.file.filename, f.invoice_file.path)
      end
    end

    zip_data = File.read(temp_file.path)
    send_data(zip_data, :type => 'application/zip', :filename => filename)


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
