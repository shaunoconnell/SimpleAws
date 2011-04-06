

puts "attempting to connect to s3"

require 'aws/s3'

# s3_key_id = "AKIAJRRXVOQBX7AVKBNQ"
# s3_password = "jPPJV8FqGate+UmoICBNQL8qcRGxiOmtq22soedu"
# 
# AWS::S3::Base.establish_connection!(
#     :access_key_id     => s3_key_id,
#     :secret_access_key => s3_password
# )

AWS::S3::Base.establish_connection!(
     :access_key_id     => ENV['AMAZON_ACCESS_KEY_ID'],
     :secret_access_key => ENV['AMAZON_SECRET_ACCESS_KEY']
)
puts "attempting to get info"


result = AWS::S3::Service.buckets

# puts "r.class #{result.class}"
puts result


AWS::S3::Bucket.create "sample_busket"

b = AWS::S3::Bucket.find "sample_busket"

puts "bucket name #{b.name}"




