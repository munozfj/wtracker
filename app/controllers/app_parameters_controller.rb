class AppParametersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_app_parameter, only: [:show, :edit, :update, :destroy]

  # GET /app_parameters
  # GET /app_parameters.json
  def index
    @app_parameters = AppParameter.all
  end

  # GET /app_parameters/1
  # GET /app_parameters/1.json
  def show
  end

  # GET /app_parameters/new
  def new
    @app_parameter = AppParameter.new
  end

  # GET /app_parameters/1/edit
  def edit
  end

  # POST /app_parameters
  # POST /app_parameters.json
  def create
    @app_parameter = AppParameter.new(app_parameter_params)

    respond_to do |format|
      if @app_parameter.save
        format.html { redirect_to @app_parameter, notice: 'App parameter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @app_parameter }
      else
        format.html { render action: 'new' }
        format.json { render json: @app_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_parameters/1
  # PATCH/PUT /app_parameters/1.json
  def update
    respond_to do |format|
      if @app_parameter.update(app_parameter_params)
        format.html { redirect_to @app_parameter, notice: 'App parameter was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @app_parameter }
      else
        format.html { render action: 'edit' }
        format.json { render json: @app_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_parameters/1
  # DELETE /app_parameters/1.json
  def destroy
    @app_parameter.destroy
    respond_to do |format|
      format.html { redirect_to app_parameters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_parameter
      @app_parameter = AppParameter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_parameter_params
      params.require(:app_parameter).permit(:group, :code, :value, :description)
    end
end
