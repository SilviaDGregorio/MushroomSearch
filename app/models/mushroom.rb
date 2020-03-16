class Mushroom < ApplicationRecord
  require "csv"
  require "activerecord-import/base"
  require "activerecord-import/active_record/adapters/postgresql_adapter"

  def self.my_import()
    mushrooms = []

    CSV.foreach("app/assets/agaricus-lepiota.data", headers: true) do |row|
      mushrooms << Mushroom.new(row.to_h)
    end
    Mushroom.import mushrooms, recursive: true
  end
end
