class Purchase < ActiveRecord::Base
  self.table_name = "compras"
  belongs_to :client, foreign_key: "id_cliente", inverse_of: 'purchases'
  belongs_to :product, foreign_key: "id_producto", inverse_of: 'purchases'
  validates :id_cliente, :id_producto, presence: true
end
