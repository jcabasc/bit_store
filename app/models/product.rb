class Product < ActiveRecord::Base
  include EventRecorder
  self.table_name = "productos"
  has_many :purchases, foreign_key: "id_producto", dependent: :destroy, inverse_of: 'product'
  has_many :clients, through: :purchases
  validates :producto, :precio, presence: true
  validates :precio, numericality: { only_integer: true }
end
