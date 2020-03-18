# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
case Rails.env
when "test"
  Mushroom.delete_all
  Mushroom.create(
    classes: "e", cap_shape: "b", cap_surface: "f", cap_color: "n", bruises: "t",
    odor: "a", gill_attachment: "a", gill_spacing: "c", gill_size: "b", gill_color: "k", stalk_shape: "e",
    stalk_root: "b", stalk_surface_above_ring: "f", stalk_surface_below_ring: "f", stalk_color_above_ring: "n",
    stalk_color_below_ring: "n", veil_type: "p", veil_color: "n", ring_number: "n", ring_type: "c",
    spore_print_color: "k", population: "a", habitat: "g",
  )
end
