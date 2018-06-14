class Document < ApplicationRecord
  belongs_to :user
  mount_uploader :file, UserFileUploader
end
