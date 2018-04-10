class Invoice < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :invoice_file, InvoiceFileUploader

  def self.get_xml_content_by_tag(tag, content)
    begin
      @result = content.scan(/ <#{tag}>(.*)<\/#{tag}>/).flatten
    rescue
      return nil
    end
    return @result
  end

  def self.missing_invoices? invoice_collection
    return false if invoice_collection.empty?

    invoice_numbers = []
    invoice_collection.each do |item|
      nnf = Invoice.get_xml_content_by_tag('nNF', item)
      invoice_numbers.push(nnf.first.to_i) if nnf.first != nil
    end

    invoice_numbers = invoice_numbers.sort

    max = invoice_numbers[invoice_numbers.size - 1]
    min = invoice_numbers[0]

    for i in min..max
      return true if !invoice_numbers.include? i
    end

    return false
  end

end
