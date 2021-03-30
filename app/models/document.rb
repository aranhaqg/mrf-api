class Document < ApplicationRecord
  validates :body, presence: true

  def export_pdf
    "/#{self.id}.pdf" 
  end
end
