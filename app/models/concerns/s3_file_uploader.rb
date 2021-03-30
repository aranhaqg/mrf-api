require 'aws-sdk'

module S3FileUploader
  extend ActiveSupport::Concern

  private

  def upload_file(file_path, file_name)
    name = File.basename file_name
    
    object = S3_BUCKET.object(name)

    if object.upload_file(file_name)
      object.public_url
    else
      file_upload_error
    end
  end

  def file_upload_error
    GraphQL::ExecutionError.new('Error uploading file.')
  end
end
  