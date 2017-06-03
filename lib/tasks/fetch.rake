task fetch: :environment do
  puts "Fetching photos from #{ENV['PHOTOS_URL']}..."
  PhotoJob.perform_now
  puts "Done!"
end
