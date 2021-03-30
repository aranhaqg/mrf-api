class Document < ApplicationRecord
  include S3FileUploader

  validates :body, presence: true
  def pdf_url
    pdf = WickedPdf.new.pdf_from_string(self.body)
    
    file_name = "/#{self.id}.pdf"
    
    overlay = Tempfile.new(file_name)
    overlay.binmode
    overlay.write(pdf)
    overlay.close
    overlay.path

    upload_file(overlay.path, file_name)
  end
end
