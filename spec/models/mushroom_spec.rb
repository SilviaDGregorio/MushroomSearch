require "rails_helper"

RSpec.describe Mushroom, type: :model do
  context "with the choosen value" do
    it "where cap_shape is b" do
      @mushrooms = Mushroom.cap_shape("b")
      expect(@mushrooms.count).to eq(1)
    end
    it "where class_type is e" do
      @mushrooms = Mushroom.class_type("e")
      expect(@mushrooms.count).to eq(1)
    end
    it "where cap_surface is f" do
      @mushrooms = Mushroom.cap_surface("f")
      expect(@mushrooms.count).to eq(1)
    end
    it "where cap_color is n" do
      @mushrooms = Mushroom.cap_color("n")
      expect(@mushrooms.count).to eq(1)
    end
    it "where bruises is t" do
      @mushrooms = Mushroom.bruis("t")
      expect(@mushrooms.count).to eq(1)
    end
    it "where odor is a" do
      @mushrooms = Mushroom.odor("a")
      expect(@mushrooms.count).to eq(1)
    end
    it "where gill_attachment is a" do
      @mushrooms = Mushroom.gill_attachment("a")
      expect(@mushrooms.count).to eq(1)
    end
    it "where gill_spacing is c" do
      @mushrooms = Mushroom.gill_spacing("c")
      expect(@mushrooms.count).to eq(1)
    end
    it "where gill_size is b" do
      @mushrooms = Mushroom.gill_size("b")
      expect(@mushrooms.count).to eq(1)
    end
    it "where gill_color is k" do
      @mushrooms = Mushroom.gill_color("k")
      expect(@mushrooms.count).to eq(1)
    end
    it "where stalk_shape is e" do
      @mushrooms = Mushroom.stalk_shape("e")
      expect(@mushrooms.count).to eq(1)
    end
    it "where stalk_root is b" do
      @mushrooms = Mushroom.stalk_root("b")
      expect(@mushrooms.count).to eq(1)
    end
    it "where stalk_surface_above_ring is f" do
      @mushrooms = Mushroom.stalk_surface_above_ring("f")
      expect(@mushrooms.count).to eq(1)
    end
    it "where stalk_surface_below_ring is f" do
      @mushrooms = Mushroom.stalk_surface_below_ring("f")
      expect(@mushrooms.count).to eq(1)
    end
    it "where stalk_color_above_ring is n" do
      @mushrooms = Mushroom.stalk_color_above_ring("n")
      expect(@mushrooms.count).to eq(1)
    end
    it "where stalk_color_below_ring is n" do
      @mushrooms = Mushroom.stalk_color_below_ring("n")
      expect(@mushrooms.count).to eq(1)
    end
    it "where veil_type is p" do
      @mushrooms = Mushroom.veil_type("p")
      expect(@mushrooms.count).to eq(1)
    end
    it "where veil_color is n" do
      @mushrooms = Mushroom.veil_color("n")
      expect(@mushrooms.count).to eq(1)
    end
    it "where ring_type is c" do
      @mushrooms = Mushroom.ring_type("c")
      expect(@mushrooms.count).to eq(1)
    end
    it "where spore_print_color is k" do
      @mushrooms = Mushroom.spore_print_color("k")
      expect(@mushrooms.count).to eq(1)
    end
    it "where population is a" do
      @mushrooms = Mushroom.population("a")
      expect(@mushrooms.count).to eq(1)
    end
    it "where habitat is g" do
      @mushrooms = Mushroom.habitat("g")
      expect(@mushrooms.count).to eq(1)
    end
  end
end
