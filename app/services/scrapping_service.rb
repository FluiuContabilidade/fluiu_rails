class ScrappingService
  require 'mechanize'

  def get_negative_certificative user
    session = Mechanize.new
    session.get('http://www.fazenda.df.gov.br/area.cfm?id_area=449') do |page|
      page.form_with(:action => 'aplicacoes/certidao/emite_certidao.cfm') do |f|
        f.radiobuttons_with(:name => 'identificador')[0].check
        f.argumento = user.cpf
        @response = f.submit
      end
    end

    begin
      if @response.search('h2').last.text() == "NÃ\u0083O FOI POSSÃ\u008DVEL EMITIR SUA CERTIDÃ\u0083O. "
        return false
      end
    rescue
      return false
    end

    return true
  end

  






end
