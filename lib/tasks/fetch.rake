task fetch: :environment do
  Fetcher.new.call
end
