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

  def events
    @agent_events = Appointment.agent_owner.all.sort  {|y,x| x.day[0..1] <=> y.day[0..1]}
    @client_events = Appointment.client_owner.all.sort  {|y,x| x.day[0..1] <=> y.day[0..1]}
  end

  def fiscal_page
    @date = DateTime.new(DateTime.now.year, DateTime.now.month - 1, DateTime.now.day).strftime('%Y-%m')
    @users = User.client_role.all
  end

  def test
    # s = AutomatizationService.new
    # response = s.get_payment_ticket
  end
  # def test
  #   s = AutomatizationService.new
  #   # response =  s.get_negative_certificative current_user
  #   s.get_debit_relative_certificate
  # end

end
