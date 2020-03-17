class MushroomsController < ApplicationController
  before_action :set_mushroom, only: [:show, :edit, :update, :destroy]

  # GET /mushrooms
  # GET /mushrooms.json
  def index
    @mushrooms = Mushroom.filter(params.slice(:classes, :cap_shape, :cap_surface, :cap_color, :bruises, :odor, :gill_attachment,
                                              :gill_spacing, :gill_size, :gill_color, :stalk_shape, :stalk_root,
                                              :stalk_surface_above_ring, :stalk_surface_below_ring, :stalk_color_above_ring,
                                              :stalk_color_below_ring, :veil_type, :veil_color, :ring_number, :ring_type, :spore_print_color,
                                              :population, :habitat))
  end

  def import
    Mushroom.my_import()
    redirect_to root_url, notice: "Successfully Imported Mushrooms!"
  end

  # GET /mushrooms/1
  # GET /mushrooms/1.json
  def show
  end

  # GET /mushrooms/new
  def new
    @mushroom = Mushroom.new
  end

  # GET /mushrooms/1/edit
  def edit
  end

  # POST /mushrooms
  # POST /mushrooms.json
  def create
    @mushroom = Mushroom.new(mushroom_params)

    respond_to do |format|
      if @mushroom.save
        format.html { redirect_to @mushroom, notice: "Mushroom was successfully created." }
        format.json { render :show, status: :created, location: @mushroom }
      else
        format.html { render :new }
        format.json { render json: @mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mushrooms/1
  # PATCH/PUT /mushrooms/1.json
  def update
    respond_to do |format|
      if @mushroom.update(mushroom_params)
        format.html { redirect_to @mushroom, notice: "Mushroom was successfully updated." }
        format.json { render :show, status: :ok, location: @mushroom }
      else
        format.html { render :edit }
        format.json { render json: @mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mushrooms/1
  # DELETE /mushrooms/1.json
  def destroy
    @mushroom.destroy
    respond_to do |format|
      format.html { redirect_to mushrooms_url, notice: "Mushroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mushroom
    @mushroom = Mushroom.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def mushroom_params
    params.fetch(:mushroom, {}).permit(:classes, :cap_shape, :cap_surface, :cap_color, :bruises, :odor, :gill_attachment,
                                       :gill_spacing, :gill_size, :gill_color, :stalk_shape, :stalk_root,
                                       :stalk_surface_above_ring, :stalk_surface_below_ring, :stalk_color_above_ring,
                                       :stalk_color_below_ring, :veil_type, :veil_color, :ring_number, :ring_type, :spore_print_color,
                                       :population, :habitat)
  end
end
