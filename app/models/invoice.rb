class Invoice < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :monthly_report
  mount_uploader :invoice_file, InvoiceFileUploader

  def self.get_xml_content_by_tag(tag, content)
    begin
      @result = content.scan(/<#{tag}>(.*?)<\/#{tag}>/).flatten
    rescue
      return nil
    end
    return @result
  end

  def self.missing_invoices(invoice_collection,rmaxflag)
    return [] if invoice_collection.empty?

    invoice_numbers = []
    invoice_collection.each do |item|
      nnf = Invoice.get_xml_content_by_tag('nNF', item)
      invoice_numbers.push(nnf.first.to_i) if nnf != nil
    end

    invoice_numbers = invoice_numbers.sort

    max = invoice_numbers[invoice_numbers.size - 1]
    return max if rmaxflag == true
    min = invoice_numbers[0]

    missing = []
    for i in min..max
      missing.push(i) if !invoice_numbers.include? i
    end

    return missing
  end

  def update_month_field
    data_field = Invoice.get_xml_content_by_tag('dhEmi', self.invoice_file.read).first[0..6]
    update_attributes(month: data_field)
  end

  def self.price_sum collection
    sum = 0
    for invoice in collection do
      val = Invoice.get_xml_content_by_tag('vNF', invoice).first.to_f
      sum += val.to_f
    end

    return sum
  end

  def self.entry_type?(invoice, cnpj)
    return true if get_xml_content_by_tag('CNPJ', invoice).first == cnpj
    return false
  end

  def self.is_a_local_invoice? invoice
    cpof = Invoice.get_xml_content_by_tag('CFOP', invoice)
    cpof.each do |val|
      return false if (val[0] == '6') or (val[0] == '7')
    end
    return true
  end

  def self.is_a_service_invoice? invoice
    cfop = Invoice.get_xml_content_by_tag('CFOP', invoice)
    return false if (cfop.first == '5102') or (cfop.first == '6102') or (cfop.first == '7102')
    return true if (cfop.first == '5933') or (cfop.first == '6933') or (cfop.first == '7933')
  end


end
