task fetch: :environment do
  PhotoJob.perform_now
end
