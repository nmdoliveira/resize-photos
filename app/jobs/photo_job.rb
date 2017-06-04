class PhotoJob < ActiveJob::Base
  def perform
    Photo.create images
  end

  private

  def images
    JSON.parse(data)["images"].map do |image|
      { image_url: image["url"] }
    end
  end

  def data
    RestClient.get ENV["PHOTOS_URL"]
  end
end
