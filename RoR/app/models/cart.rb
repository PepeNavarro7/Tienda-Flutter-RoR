class Cart < ApplicationRecord
  belongs_to :tienda
  belongs_to :cliente
  has_many :contienes
  has_many :productos, through: :contienes
end
