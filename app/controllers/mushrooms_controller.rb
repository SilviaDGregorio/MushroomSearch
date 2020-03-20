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
