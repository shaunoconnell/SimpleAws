

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

# b = AWS::S3::Bucket.find "dev.music"
b = AWS::S3::Bucket.find "sample_busket"
puts "bucket name #{b.name}"
puts "size: #{b.count}"


  require "mp3info"
  
  song_path = "/home/shaun/Music/Radiohead/The King of Limbs/1 - Bloom.ogg"
  mp3_path = "/home/shaun/Music/Radiohead/The King of Limbs/1 - Bloom.mp3"
  # read and display infos & tags
  Mp3Info.open(song_path) do |mp3info|
    puts mp3info
  end


  Mp3Info.open(mp3_path) do |mp3|
    puts mp3.tag.title   
    puts mp3.tag.artist   
    puts mp3.tag.album
    puts mp3.tag.tracknum
  end

require "ogginfo"
  OggInfo.open(song_path) do |ogg|
    puts ogg.bitrate
    # puts ogg.artist
    puts "ogg class #{ogg.class} \n data #{ogg}"
    puts "artist #{ogg.tag.artist}"
  end





