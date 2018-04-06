class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

 enum role: [ :client, :agent, :admin], _suffix: true

 has_many :invoices

 def user_invoice_months
   months = []
   invoices.group_by(&:month).each do |key,value|
     months.push(key)
   end
   return months
 end




end
