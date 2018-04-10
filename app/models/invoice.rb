class Invoice < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :invoice_file, InvoiceFileUploader

  def self.get_xml_content_by_tag(tag, content)
    begin
      @result = content.scan(/<#{tag}>(.*)<\/#{tag}>/).flatten
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
      invoice_numbers.push(nnf.first.to_i) if nnf.first != nil
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


end
