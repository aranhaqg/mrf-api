require 'aws-sdk'

module S3FileUploader
  extend ActiveSupport::Concern

  private

  def upload_file(file_path, file_name)
    name = File.basename file_name

    object = S3_BUCKET.object(name)

    if object.upload_file(file_path)
      set_public_object(name)
      object.public_url
    else
      file_upload_error
    end
  end

  def file_upload_error
    GraphQL::ExecutionError.new('Error uploading file.')
  end

  def set_public_object(object_key)
    AWS_CLIENT.put_object_acl(
      bucket: 'mrf-pdfs',
      key: object_key,
      acl: 'public-read'
    )
    return true
  rescue StandardError => e
    puts "Error setting bucket ACL: #{e.message}"
    return false
  end
end
