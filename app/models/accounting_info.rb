class AccountingInfo < ApplicationRecord
  has_many :invoices
  belongs_to :user
  mount_uploader :financial_spreadsheet, UserFileUploader
end
