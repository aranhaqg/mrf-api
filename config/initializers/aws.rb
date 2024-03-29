Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
})

AWS_CLIENT = Aws::S3::Client.new(region: 'us-east-2')

S3_BUCKET = Aws::S3::Resource.new.bucket('mrf-pdfs')
