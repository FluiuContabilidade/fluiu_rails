class InvoicesService

  def self.setup_invoice_collection collection
    col = []
    collection.each do |f|
      col.push(f.invoice_file.read)
    end
    return col
  end

end
