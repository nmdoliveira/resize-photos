class PhotosController < ApplicationController
  respond_to :json

  def index
    respond_with photo_collection
  end

  private

  def photo_collection
    @photo_collection ||= PhotoCollection.new(photos)
  end

  def photos
    Photo.exists? ? Photo.all : PhotoJob.perform_now
  end
end
