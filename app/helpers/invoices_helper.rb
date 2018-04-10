module InvoicesHelper

  def generate_xml_report invoices
    return nil if invoices == nil

    report = {}
    report.company_name = User.find(invoice.first.user_id).company_name
    report.month = invoice.first.month
    report.correct_sequence = Invoice.missing_invoices? invoices
    report.greatest_number = Invoice.get_greatest_invoice_number invoices 

  end

end
