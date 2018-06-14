class InvoicesService

  def self.zip_invoice_files user
    date = DateTime.new(DateTime.now.year, DateTime.now.month - 1, DateTime.now.day)
    @invoices = user.invoices.where month: date.strftime('%Y-%m')

    filename = user.company + DateTime.now.to_s + '.zip'
    temp_file = Tempfile.new(filename)

    begin
      ## 07/06/2018
      # FIXME:  This will only work on production environment.
      Zip::File.open(temp_file.path, Zip::File::CREATE) do |zip_file|
        @invoices.each do |f|
          zip_file.add(f.invoice_file.file.filename, f.invoice_file.path)
        end
      end

      zip_data = File.read(temp_file.path)
      return {data: zip_data, filename: filename}

    rescue
      return nil
    end
    
  end

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
