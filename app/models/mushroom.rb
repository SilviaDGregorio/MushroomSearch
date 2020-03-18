class Mushroom < ApplicationRecord
  include Filterable
  require "csv"
  require "activerecord-import/base"
  require "activerecord-import/active_record/adapters/postgresql_adapter"

  enum cap_shape: { bell: "b", conical: "c", convex: "x", flat: "f", knobbed: "k", sunken: "s" }, _suffix: true
  enum class_type: { edible: "e", poisonous: "p" }, _suffix: true
  enum cap_surface: { fibrous: "f", grooves: "g", scaly: "y", smooth: "s" }, _suffix: true
  enum cap_color: { brown: "n", buff: "b", cinnamon: "c", gray: "g", green: "r", pink: "p", purple: "u", red: "e", white: "w", yellow: "y" }, _suffix: true
  enum bruises: { bruises: "t", no: "f" }, _suffix: true
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

  scope :cap_shape, ->(cap_shape) { where cap_shape: cap_shape }
  scope :cap_surface, ->(cap_surface) { where cap_surface: cap_surface }
  scope :class_type, ->(class_type) { where classes: class_type }
  scope :cap_color, ->(cap_color) { where cap_color: cap_color }
  scope :bruis, ->(bruises) { where bruises: bruises }
  scope :odor, ->(odor) { where odor: odor }
  scope :gill_attachment, ->(gill_attachment) { where gill_attachment: gill_attachment }
  scope :gill_spacing, ->(gill_spacing) { where gill_spacing: gill_spacing }
  scope :gill_size, ->(gill_size) { where gill_size: gill_size }
  scope :gill_color, ->(gill_color) { where gill_color: gill_color }
  scope :stalk_shape, ->(stalk_shape) { where stalk_shape: stalk_shape }
  scope :stalk_root, ->(stalk_root) { where stalk_root: stalk_root }
  scope :stalk_surface_above_ring, ->(stalk_surface_above_ring) { where stalk_surface_above_ring: stalk_surface_above_ring }
  scope :stalk_surface_below_ring, ->(stalk_surface_below_ring) { where stalk_surface_below_ring: stalk_surface_below_ring }
  scope :stalk_color_above_ring, ->(stalk_color_above_ring) { where stalk_color_above_ring: stalk_color_above_ring }
  scope :stalk_color_below_ring, ->(stalk_color_below_ring) { where stalk_color_below_ring: stalk_color_below_ring }
  scope :veil_type, ->(veil_type) { where veil_type: veil_type }
  scope :veil_color, ->(veil_color) { where veil_color: veil_color }
  scope :ring_number, ->(ring_number) { where ring_number: ring_number }
  scope :ring_type, ->(ring_type) { where ring_type: ring_type }
  scope :spore_print_color, ->(spore_print_color) { where spore_print_color: spore_print_color }
  scope :population, ->(population) { where population: population }
  scope :habitat, ->(habitat) { where habitat: habitat }
  def self.my_import()
    mushrooms = []
    CSV.foreach("app/assets/agaricus-lepiota.data", headers: true) do |row|
      mushrooms << Mushroom.new(row.to_h)
    end
    Mushroom.import mushrooms, recursive: true
  end
end
