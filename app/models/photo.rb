class Photo
  include Mongoid::Document
  extend Dragonfly::Model

  field :image_uid

  dragonfly_accessor :image
end
