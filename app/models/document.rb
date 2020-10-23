#require "pdfkit"
class Document < ApplicationRecord
  validates :body, presence: true

  def pdf_url
    pdf_path = "/tmp/mrf_#{self.id}.pdf"
    #kit = PDFKit.new(self.body, page_size: 'A4').to_file(pdf_path)
    pdf_path
  end
end
