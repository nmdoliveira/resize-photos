module PhotoRepresenter
  include Roar::JSON

  property :small_url
  property :medium_url
  property :large_url

  def small_url
    url "320x240"
  end

  def medium_url
    url "384x288"
  end

  def large_url
    url "640x480"
  end

  def url(size)
    image.thumb(size).url
  end
end
