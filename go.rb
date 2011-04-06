

puts "attempting to connect to s3"

require 'aws/s3'

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




