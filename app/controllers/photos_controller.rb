class PhotosController < ApplicationController
  respond_to :json

  def index
    respond_with photos
  end

  private

  def photos
    @photos ||= PhotoCollection.new(Photo.all)
  end
end
