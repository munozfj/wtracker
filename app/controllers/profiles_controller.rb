class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.where( user_id: current_user.id)
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
        flash[:notice]="Profile was successfully created."
        redirect_to profiles_path
    else
        render new_profile_path(@profile)
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find_by_user_id(current_user.id)
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
      if @profile.update(profile_params)
        flash[:notice]='Profile was successfully updated.'
        redirect_to profiles_path
      else
        render edit_profile_path(@profile)
      end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :first_name, :last_name, :nickname, :email, :gender, :date_birth, :height, :activity_type)
    end
end
