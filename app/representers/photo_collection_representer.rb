module PhotoCollectionRepresenter
  include Roar::JSON

  collection :photos, extend: PhotoRepresenter
end
