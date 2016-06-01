class Product < ActiveRecord::Base
  self.table_name = "productos"
  validates :producto, :precio, presence: true
  validates :precio, numericality: { only_integer: true }
end
