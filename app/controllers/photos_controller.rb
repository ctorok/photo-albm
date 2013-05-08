class PhotosController < ApplicationController
  def new
       # binding.pry
    @photo = Photo.new
  end

  def create
    # binding.pry
    photo = Photo.create(params[:photo])
    album = Album.find(params[:album_id]) #find the album the photo belongs to (we passed this in the hidden field in the _form)
    album.photos << photo
    @photos = album.photos
    # binding.pry
  end

  def destroy
    binding.pry
  end

  def destroy_multiple

    @photos = Photo.find(params[:photo_ids])
    @photos.each do |photo|
      product.destroy
    end
    # flash[:notice] = "Deleted photos!"
    # redirect_to products_path
  end
  end
end