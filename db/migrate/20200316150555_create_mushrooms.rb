class CreateMushrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :mushrooms do |t|
      t.timestamps
    end
    execute <<-SQL
      CREATE TYPE classes AS ENUM ('e','p');
      CREATE TYPE cap_shape AS ENUM ('b','c','x','f','k','s');
      CREATE TYPE cap_surface AS ENUM ('f', 'g', 'y','s');
      CREATE TYPE cap_color AS ENUM ('n','b','c','g','r','p','u','e','w','y');
      CREATE TYPE bruises AS ENUM ('t','f');
      CREATE TYPE odor AS ENUM('a','l','c','y','f','m','n','p','s');
      CREATE TYPE gill_attachment AS ENUM('a','d','f','n');
      CREATE TYPE gill_spacing AS ENUM('c','w','d');
      CREATE TYPE gill_size AS ENUM('b','n');
      CREATE TYPE gill_color AS ENUM('k','n','b','h','g','r','o','p','u','e','w','y');
      CREATE TYPE stalk_shape AS ENUM('e','t');
      CREATE TYPE stalk_root AS ENUM('b','c','u','e','z','r','?');
      CREATE TYPE stalk_surface_above_ring AS ENUM('f','y','k','s');
      CREATE TYPE stalk_surface_below_ring AS ENUM('f','y','k','s');
      CREATE TYPE stalk_color_above_ring AS ENUM('n','b','c','g','o','p','e','w','y');
      CREATE TYPE stalk_color_below_ring AS ENUM('n','b','c','g','o', 'p','e','w','y');
      CREATE TYPE veil_type AS ENUM('p','u');
      CREATE TYPE veil_color AS ENUM('n','o','w','y');
      CREATE TYPE ring_number AS ENUM('n','o','t');
      CREATE TYPE ring_type AS ENUM('c','e','f','l','n','p','s','z');
      CREATE TYPE spore_print_color AS ENUM('k','n','b','h','r','o','u','w','y');
      CREATE TYPE population AS ENUM('a','c','n','s','v','y');
      CREATE TYPE habitat AS ENUM('g','l','m','p','u','w','d');
    SQL
    add_column :mushrooms, :classes, :classes
    add_column :mushrooms, :cap_shape, :cap_shape
    add_column :mushrooms, :cap_surface, :cap_surface
    add_column :mushrooms, :cap_color, :cap_color
    add_column :mushrooms, :bruises, :bruises
    add_column :mushrooms, :odor, :odor
    add_column :mushrooms, :gill_attachment, :gill_attachment
    add_column :mushrooms, :gill_spacing, :gill_spacing
    add_column :mushrooms, :gill_size, :gill_size
    add_column :mushrooms, :gill_color, :gill_color
    add_column :mushrooms, :stalk_shape, :stalk_shape
    add_column :mushrooms, :stalk_root, :stalk_root
    add_column :mushrooms, :stalk_surface_above_ring, :stalk_surface_above_ring
    add_column :mushrooms, :stalk_surface_below_ring, :stalk_surface_below_ring
    add_column :mushrooms, :stalk_color_above_ring, :stalk_color_above_ring
    add_column :mushrooms, :stalk_color_below_ring, :stalk_color_below_ring
    add_column :mushrooms, :veil_type, :veil_type
    add_column :mushrooms, :veil_color, :veil_color
    add_column :mushrooms, :ring_number, :ring_number
    add_column :mushrooms, :ring_type, :ring_type
    add_column :mushrooms, :spore_print_color, :spore_print_color
    add_column :mushrooms, :population, :population
    add_column :mushrooms, :habitat, :habitat
  end
end
