class PhotoJob < ActiveJob::Base
  def perform
    images.each do |image|
      Photo.create image_url: image["url"]
    end
  end

  private

  def images
    JSON.parse(data)["images"]
  end

  def data
    RestClient.get ENV["PHOTOS_URL"]
  end
end
