class InvoicesService

  def self.setup_invoice_collection collection
    col = []
    collection.each do |f|
      col.push(f.invoice_file.read)
    end
    return col
  end

  def self.format_date date
    return date[0..6]
  end

end
