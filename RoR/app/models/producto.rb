class Producto < ApplicationRecord
  has_many :contienes
  has_many :carts, through: :contienes
end
