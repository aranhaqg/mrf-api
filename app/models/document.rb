class Document < ApplicationRecord
  validates :body, presence: true

  def pdf_url
    pdf = WickedPdf.new.pdf_from_string(self.body)
  
    overlay = Tempfile.new("/#{self.id}.pdf")
    overlay.binmode
    overlay.write(pdf)
    overlay.close
    overlay.path
  end
end
