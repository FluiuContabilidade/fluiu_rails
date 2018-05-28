class PagesController < ApplicationController
  # load_and_authorize_resource
  include PagesHelper


  def home_page
    @user = current_user
    @total_in = current_user.get_monthly_invoice_total(Time.now.strftime('%Y-%m'), 'in')
    @total_out = current_user.get_monthly_invoice_total(Time.now.strftime('%Y-%m'), 'out')
    @message = PagesHelper.mount_missing_invoice_message current_user
    @tax_extimative = current_user.get_company_tax_percentage
  end

  def test
    s = ScrappingService.new
    response =  s.get_negative_certificative current_user
  end

end
