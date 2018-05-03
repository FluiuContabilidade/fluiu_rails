module InvoicesHelper

  def self.generate_xml_report(invoices, user_id, month)
    return nil if invoices == nil

    invoices_content = InvoicesService.setup_invoice_collection invoices

    report = {}
    report[:company_name] = User.find(user_id).company
    report[:month] = month
    report[:missing_invoices] = Invoice.missing_invoices(invoices_content,false)
    report[:greatest_number] = Invoice.missing_invoices(invoices_content,true)
    report[:price] = Invoice.price_sum invoices_content
    report[:price] += report[:price] * User.find(user_id).get_company_tax_percentage
    return report
  end

  # def self.generate_single_report invoice
  # end

end
