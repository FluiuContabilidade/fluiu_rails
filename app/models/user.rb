class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

 enum role: [ :client, :agent, :admin], _suffix: true
 enum opening_status: [:open, :validation, :waiting_documents, :comercial]

 has_many :invoices
 has_many :accounting_infos
 has_many :documents

 mount_uploader :patrimonial_balance, UserFileUploader
 mount_uploader :dre_file, UserFileUploader
 mount_uploader :social_contract, UserFileUploader
 mount_uploader :business_licence, UserFileUploader
 mount_uploader :cnpj_file, UserFileUploader
 mount_uploader :personal_file, UserFileUploader
 mount_uploader :das_file, UserFileUploader
 mount_uploader :fgts, UserFileUploader
 mount_uploader :inss, UserFileUploader
 mount_uploader :fau, UserFileUploader
 mount_uploader :tributary_sub, UserFileUploader
 mount_uploader :payment_installments, UserFileUploader


def valid_accounting_info_url date
  accounting_info = accounting_infos.where(month: date)
  accounting_info = accounting_info.where.not(financial_spreadsheet: nil)

  accounting_info.each do |e|
    return e.financial_spreadsheet.url
  end

end

# Returs if user has accounting info where financial_spreadsheet is not nil for the date given
def has_month_accounting_info? date
  accounting_info = accounting_infos.where(month: date)
  accounting_info = accounting_info.where.not(financial_spreadsheet: nil)

  return true if accounting_info.size != 0
  return false
end

 # Returns true if user created Invoice with the declaration_flag == true
 def invoice_from_month_is_empty? date
   if invoices.where(month: date).last.declaration_flag == true
     return true
   else
     return false
   end
 end

## Method returns if user has monthly
 def has_monthly_document?(name,date)
   @date = date
   das = documents.where(name: name)
   das = das.reject {|a| a.created_at.strftime('%Y-%m') != @date }
   return false if das == []
   return true
 end

 ## Method returns a list of users that have not sent invoices for the param date
 def self.not_sent_invoices_users date
   users = []
   User.client_role.all.each do |user|
     users.push(user) if !(user.has_month_invoices? date)
   end
   return users
 end

 def user_invoice_months
   months = []
   invoices.group_by(&:month).each do |key,value|
     months.push(key)
   end
   return months
 end

 def get_monthly_invoice_total(month, return_type)
   all_invoices = invoices.where(month: month)
   invoices = []

   all_invoices.each do |f|
     if return_type == 'in'
       invoices.push(f.invoice_file.read) if Invoice.entry_type?(f.invoice_file.read, cnpj)
     else
       invoices.push(f.invoice_file.read) if !(Invoice.entry_type?(f.invoice_file.read, cnpj))
     end
   end

   return (Invoice.price_sum(invoices))
 end

 def has_month_invoices? month
   return user_invoice_months.include?(month)
 end

 def request_opening_status_change message
   ApplicationMailer.opening_status_change(self,message).deliver_now
   return
 end

 def get_company_tax_percentage
   if(earnings_type == "1")
     case earnings_range
       when '1'
         return 0.04
       when '2'
         return 0.0730
       when '3'
         return 0.0950
       when '4'
         return 0.1070
       when '5'
         return 0.1430
       when '6'
         return 0.1900
     end
   elsif(earnings_type == "2")
     case earnings_range
     when '1'
       return 0.0450
     when '2'
       return 0.0780
     when '3'
       return 0.1
     when '4'
       return 0.1120
     when '5'
       return 0.1470
     when '6'
       return 0.3
     end
   elsif(earnings_type == "3")
     case earnings_range
     when '1'
       return 0.06
     when '2'
       return 0.1120
     when '3'
       return 0.1350
     when '4'
       return 0.16
     when '5'
       return 0.21
     when '6'
       return 0.33
     end
   elsif(earnings_type == "4")
     case earnings_range
     when '1'
       return 0.0450
     when '2'
       return 0.09
     when '3'
       return 0.1020
     when '4'
       return 0.14
     when '5'
       return 0.22
     when '6'
       return 0.33
     end
   elsif(earnings_type == "5")
     case earnings_range
     when '1'
       return 0.1550
     when '2'
       return 0.18
     when '3'
       return 0.1950
     when '4'
       return 0.2050
     when '5'
       return 0.23
     when '6'
       return 0.3050
     end
   end
   return 0
 end

end
