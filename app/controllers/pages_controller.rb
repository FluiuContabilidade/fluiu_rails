class PagesController < ApplicationController
  include PagesHelper

  def home_page
    @user = current_user
    @total_in = current_user.get_monthly_invoice_total(Time.now.strftime('%Y-%m'), 'in')
    @total_out = current_user.get_monthly_invoice_total(Time.now.strftime('%Y-%m'), 'out')
    @message = PagesHelper.mount_missing_invoice_message current_user
    @tax_extimative = current_user.get_company_tax_percentage
  end

  # def test
  #   # require 'capybara/rails'
  #   # session = Capybara::Session.new(:selenium_chrome)
  #   # session.visit('http://portalservicos.jcdf.mdic.gov.br/Portal/pages/consultaProcesso.jsf')
  #   # session.fill_in('protocolo', with: current_user.protocol)
  #   # session.click_link('Pesquisar')
  #   # redirect_to '/home'
  #   require 'capybara/rails'
  #   session = Capybara::Session.new(:selenium_chrome)
  #   session.visit('http://servicos.receita.fazenda.gov.br/Servicos/certidao/CndConjuntaInter/InformaNICertidao.asp?Tipo=1')
  #   session.click_button('Recarregar')
  #   redirect_to '/home'
  # end

end
