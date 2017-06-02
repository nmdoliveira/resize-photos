class PhotosController < ApplicationController
  respond_to :json

  def index
    respond_with photos, represent_items_with: PhotoRepresenter
  end

  private

  def photos
    @photos ||= Photo.all.to_a
  end
end
