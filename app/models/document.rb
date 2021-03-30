class Document < ApplicationRecord
  include S3FileUploader

  validates :body, presence: true
  def pdf_url
    pdf = generate_pdf
    file_name = "/#{self.id}.pdf"

    upload_file(pdf.path, file_name)
  end

  def generate_pdf
    pdf = WickedPdf.new.pdf_from_string(self.body)

    temp_file = Tempfile.new(["#{self.id}", ".pdf"], Rails.root.join('tmp'))
    temp_file.binmode
    temp_file.write(pdf)
    temp_file.close
    temp_file
  end
end
