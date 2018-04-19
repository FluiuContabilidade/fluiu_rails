class InvoicesService

  def self.setup_invoice_collection collection
    col = []
    collection.each do |f|
      col.push(f.invoice_file.read)
    end
    return col
  end

  def self.group_invoice_by_entry_type(user_id, month, type)
    invoices = []
    Invoice.where(user_id: user_id, month: month).each do |i|
      if type == 'out'
        invoices.push(i) if Invoice.entry_type?(i.invoice_file.read, User.find(user_id).cnpj) == true
      else
        invoices.push(i) if Invoice.entry_type?(i.invoice_file.read, User.find(user_id).cnpj) == false
      end
    end
    return invoices
  end

end
