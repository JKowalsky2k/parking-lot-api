class ParkingSlotsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_parking_slot, only: [:show, :edit, :update, :destroy, :book, :book_off, :add, :remove]
  swagger_controller :parking_slots, 'ParkingSlots'
  
  # GET /parking_slots or /parking_slots.json
  swagger_api :index do
    summary 'Returns all parking slots'
  end
  def index
    @parking_slots = ParkingSlot.all
  end

  # GET /parking_slots/1 or /parking_slots/1.json
  swagger_api :show do
    summary 'Returns one parking slot'
    param :path, :id, :integer, :required, "Parking slot id"
  end
  def show
  end

  # GET /parking_slots/new
  def new
    @parking_slot = ParkingSlot.new
  end

  # GET /parking_slots/1/edit
  def edit
  end
  swagger_api :book do
    summary 'Allows booking a parking slot'
    param :path, :id, :integer, :required, "id"
  end
  def book
    if parking_slot_available?(@parking_slot.id)
      unless current_user.books?(@parking_slot)
        current_user.parking_slots.append(@parking_slot)
      end
    end
    redirect_to @parking_slot
  end

  swagger_api :book_off do
    summary 'Allows to book off a parking slot'
    param :path, :id, :integer, :required, "id"
  end
  def book_off
    if current_user.books?(@parking_slot)
      current_user.parking_slots.delete(@parking_slot)
    end
    redirect_to @parking_slot
  end
  
  swagger_api :add do # dopytac Jedrzeja co to robi
    summary 'Adds a new parking slot'
    param :path, :id, :integer, :required, "id"
  end
  def add
    Parking.all[0].parking_slots.append(@parking_slot)
    redirect_to @parking_slot
  end

  swagger_api :remove do
    summary 'Deletes a parking slot'
    param :path, :id, :integer, :required, "id"
  end
  def remove
    Parking.all[0].parking_slots.delete(@parking_slot)
    redirect_to @parking_slot
  end

  # POST /parking_slots or /parking_slots.json
  swagger_api :create do
    summary 'Creates a parking slot'
    param :path, :id, :integer, :required, "id"
    param :form, "parking_slot[position]", :integer, :required, "Position"
  end
  def create
    @parking_slot = ParkingSlot.new(parking_slot_params)

    respond_to do |format|
      if @parking_slot.save
        format.html { redirect_to parking_slot_url(@parking_slot), notice: "Parking slot was successfully created." }
        format.json { render :show, status: :created, location: @parking_slot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_slots/1 or /parking_slots/1.json
  swagger_api :update do
    summary 'Updates a parking slot'
    param :path, :id, :integer, :required, "id"
    param :form, "parking_slot[position]", :integer, :required, "Position"
  end
  def update
    respond_to do |format|
      if @parking_slot.update(parking_slot_params)
        format.html { redirect_to parking_slot_url(@parking_slot), notice: "Parking slot was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_slot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_slots/1 or /parking_slots/1.json
  swagger_api :destroy do
    summary 'Deletes a parking slot'
    param :path, :id, :integer, :required, "id"
  end
  def destroy
    @parking_slot.destroy

    respond_to do |format|
      format.html { redirect_to parking_slots_url, notice: "Parking slot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_slot
      @parking_slot = ParkingSlot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_slot_params
      params.require(:parking_slot).permit(:position)
    end
end
