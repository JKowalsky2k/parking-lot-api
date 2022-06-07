class ParkingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_parking, only: %i[ show edit update destroy ]
  swagger_controller :parkings, 'Parkings'

  # GET /parkings or /parkings.json
  swagger_api :index do
    summary 'Returns all parkings'
  end
  def index
    @parkings = Parking.all
  end

  # GET /parkings/1 or /parkings/1.json
  swagger_api :show do
    summary 'Returns one parking'
    param :path, :id, :integer, :required, "Parking id"
  end
  def show
  end

  # GET /parkings/new
  def new
    @parking = Parking.new
  end

  # GET /parkings/1/edit
  def edit
  end

  # POST /parkings or /parkings.json
  
  swagger_api :create do
    summary 'Creates a new parking'
    param :form, "parking[city]", :string, :required, "City"
    param :form, "parking[street]", :string, :required, "Street"
    param :form, "parking[address_number]", :string, :required, "Address number"
  end
  def create
    @parking = Parking.new(parking_params)

    respond_to do |format|
      if @parking.save
        format.html { redirect_to parking_url(@parking), notice: "Parking was successfully created." }
        format.json { render :show, status: :created, location: @parking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parkings/1 or /parkings/1.json
  swagger_api :update do
    summary 'Updates a parking'
    param :path, :id, :integer, :required, "Parking id"
    param :form, "parking[city]", :string, :required, "City"
    param :form, "parking[street]", :string, :required, "Street"
    param :form, "parking[address_number]", :string, :required, "Address number"
  end
  def update
    respond_to do |format|
      if @parking.update(parking_params)
        format.html { redirect_to parking_url(@parking), notice: "Parking was successfully updated." }
        format.json { render :show, status: :ok, location: @parking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parkings/1 or /parkings/1.json
  swagger_api :destroy do
    summary 'Deletes a parking'
    param :path, :id, :integer, :required, "id"
  end
  def destroy
    @parking.destroy

    respond_to do |format|
      format.html { redirect_to parkings_url, notice: "Parking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking
      @parking = Parking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_params
      params.require(:parking).permit(:city, :street, :address_number)
    end
end
