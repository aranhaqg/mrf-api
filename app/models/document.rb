class Document < ApplicationRecord
  include S3FileUploader
  has_many :document_sharings

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

  def is_accessible_by_user(user_id)
    return true if DocumentSharing.where(document_id: id, user_id: user_id).any?

    false
  end
end
