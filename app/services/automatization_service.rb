class AutomatizationService
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

  def get_debit_relative_certificate
    session = Mechanize.new
    client = DeathByCaptcha.new($DEATHBYCAPTCHA_USERNAME, $DEATHBYCAPTCHA_PASSWORD, :http)
    flag = true


    while flag
      print('Getting Session...')
      session.get('http://servicos.receita.fazenda.gov.br/Servicos/certidao/CndConjuntaInter/InformaNICertidao.asp?Tipo=1') do |page|
        @current_p = page.search('p')
        page.form_with(:id => 'CertidaoNegativa') do |f|
          print('Getting Captcha image...')
          begin
            @image = page.images.last.fetch.save
          rescue
            @image = ''
          end
          f.NI = '02086329000142'
          print('Solving Captcha...')
          @captcha = client.decode(path: @image)
          f.txtTexto_captcha_serpro_gov_br = @captcha.text
          @response = f.submit(f.buttons.first)
        end
      end

      if @response.search('p') == @current_p
        print('Não mudou de página. :/')
      end
      byebug

    end

  end






end
