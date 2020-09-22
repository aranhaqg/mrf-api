class DocumentSharing < ApplicationRecord
  belongs_to :user
  belongs_to :document

  validates :user_id, :document_id, presence: true
end
