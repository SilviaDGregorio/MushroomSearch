class Mushroom < ApplicationRecord
  include Filterable
  require "csv"
  require "activerecord-import/base"
  require "activerecord-import/active_record/adapters/postgresql_adapter"

  enum cap_shape: { bell: "b", conical: "c", convex: "x", flat: "f", knobbed: "k", sunken: "s" }, _suffix: true
  enum class_type: { edible: "e", poisonous: "p" }, _suffix: true
  enum cap_surface: { fibrous: "f", grooves: "g", scaly: "y", smooth: "s" }, _suffix: true
  enum cap_color: { brown: "n", buff: "b", cinnamon: "c", gray: "g", green: "r", pink: "p", purple: "u", red: "e", white: "w", yellow: "y" }, _suffix: true
  enum bruises_type: { bruises: "t", no: "f" }, _suffix: true
  enum odor: { almond: "a", anise: "l", creosote: "c", fishy: "y", foul: "f", musty: "m", none: "n", pungent: "p", spicy: "s" }, _suffix: true
  enum gill_attachment: { attached: "a", descending: "d", free: "f", notched: "n" }, _suffix: true
  enum gill_spacing: { close: "c", crowded: "w", distant: "d" }, _suffix: true
  enum gill_size: { broad: "b", narrow: "n" }, _suffix: true
  enum gill_color: { black: "k", brown: "n", buff: "b", chocolate: "h", gray: "g", green: "r", orange: "o", pink: "p", purple: "u", red: "e", white: "w", yellow: "y" }, _suffix: true
  enum stalk_shape: { enlarging: "e", tapering: "t" }, _suffix: true
  enum stalk_root: { bulbous: "b", club: "c", cup: "u", equal: "e", rhizomorphs: "z", rooted: "r", missing: "?" }, _suffix: true
  enum stalk_surface_above_ring: { fibrous: "f", scaly: "y", silky: "k", smooth: "s" }, _suffix: true
  enum stalk_surface_below_ring: { fibrous: "f", scaly: "y", silky: "k", smooth: "s" }, _suffix: true
  enum stalk_color_above_ring: { brown: "n", buff: "b", cinnamon: "c", gray: "g", orange: "o", pink: "p", red: "e", white: "w", yellow: "y" }, _suffix: true
  enum stalk_color_below_ring: { brown: "n", buff: "b", cinnamon: "c", gray: "g", orange: "o", pink: "p", red: "e", white: "w", yellow: "y" }, _suffix: true
  enum veil_type: { partial: "p", universal: "u" }, _suffix: true
  enum veil_color: { brown: "n", orange: "o", white: "w", yellow: "y" }, _suffix: true
  enum ring_number: { none: "n", one: "o", two: "t" }, _suffix: true
  enum ring_type: { cobwebby: "c", evanescent: "e", flaring: "f", large: "l", none: "n", pendant: "p", sheathing: "s", zone: "z" }, _suffix: true
  enum spore_print_color: { black: "k", brown: "n", buff: "b", chocolate: "h", green: "r", orange: "o", purple: "u", white: "w", yellow: "y" }, _suffix: true
  enum population: { abundant: "a", clustered: "c", numerous: "n", scattered: "s", several: "v", solitary: "y" }, _suffix: true
  enum habitat: { grasses: "g", leaves: "l", meadows: "m", paths: "p", urban: "u", waste: "w", woods: "d" }, _suffix: true

  [:cap_shape, :cap_surface, :classes, :bruises, :cap_color, :odor, :gill_attachment,
   :gill_spacing, :gill_size, :gill_color, :stalk_shape, :stalk_root, :stalk_surface_above_ring,
   :stalk_surface_below_ring, :stalk_color_above_ring, :stalk_color_below_ring, :veil_type,
   :veil_color, :ring_number, :ring_type, :spore_print_color, :population, :habitat]
    .each do |m|
    scope m, ->(value) { where(m => value) }
  end

  def self.my_import()
    mushrooms = []
    CSV.foreach("app/assets/agaricus-lepiota.data", headers: true) do |row|
      mushrooms << Mushroom.new(row.to_h)
    end
    Mushroom.import mushrooms, recursive: true
  end
end
