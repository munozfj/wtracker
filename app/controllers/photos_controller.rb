class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.where( user_id: current_user.id).ordered
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
        flash[:notice] = "Photo was successfully created."
        current_user.photos << @photo
        redirect_to photos_path
    else
        render new_photo_path
    end
  end

  # GET /photos/1/edit
  def edit
  end

    # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    if @photo.update(photo_params)
        flash[:notice] = "Photo was successfully updated."
        redirect_to photos_path
    else
        render edit_photo_path @photo 
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:user_id, :date, :comment, :picture)
    end
end
