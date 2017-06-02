class Fetcher
  def call
    images.each do |image|
      Photo.create(image_url: image["url"])
    end
  end

  def images
    JSON.parse(data)["images"]
  end

  def data
    RestClient.get "http://54.152.221.29/images.json"
  end
end
