module InvoicesHelper

  def self.generate_xml_report invoices
    return nil if invoices == nil

    invoices_content = InvoicesService.setup_invoice_collection invoices

    report = {}
    report[:company_name] = User.find(invoices.first.user_id).company
    report[:month] = invoices.first.month
    report[:missing_invoices] = Invoice.missing_invoices(invoices_content,false)
    report[:greatest_number] = Invoice.missing_invoices(invoices_content,true)
    report[:price] = Invoice.price_sum invoices_content

    return report
  end

  def self.generate_single_report invoice
    return nil if invoice == nil
    invoice_content = invoice.invoice_file.read

    report = {}
    report[:NCM_SH] = Invoice.get_xml_content_by_tag('NCM', invoice_content)
    report[:CFOP] = Invoice.get_xml_content_by_tag('CFOP', invoice_content)
    report[:vnf] = Invoice.get_xml_content_by_tag('vNF', invoice_content)
    report[:vDesc] = Invoice.get_xml_content_by_tag('vDesc', invoice_content)
    report[:vBC] = Invoice.get_xml_content_by_tag('vBC', invoice_content)
    report[:vICMS] = Invoice.get_xml_content_by_tag('vICMS', invoice_content)
    report[:vIPI] = Invoice.get_xml_content_by_tag('vIPI', invoice_content)
    report[:pICMS] = Invoice.get_xml_content_by_tag('pICMS', invoice_content)
    return report

  end

end
