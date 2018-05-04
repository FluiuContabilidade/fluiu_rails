module PagesHelper

  def self.mount_missing_invoice_message user
    if user.has_month_invoices? Time.now.strftime('%Y-%m')
      return nil
    else
      return "Você não enviou as notas fiscais deste mês. Clique em Rotinas Contábeis para enviá-las."
    end
  end

end
