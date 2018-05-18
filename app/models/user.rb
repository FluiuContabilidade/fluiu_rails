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
