module PhotoRepresenter
  include Roar::JSON

  property :small_url
  property :medium_url
  property :large_url

  def small_url
    url ENV["SMALL_SIZE"]
  end

  def medium_url
    url ENV["MEDIUM_SIZE"]
  end

  def large_url
    url ENV["LARGE_SIZE"]
  end

  def url(size)
    photo_url(uid: image_uid, size: size)
  end
end
