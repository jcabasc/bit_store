class Client < ActiveRecord::Base
  self.table_name = "clientes"
  has_many :purchases, foreign_key: "id_cliente", dependent: :destroy, inverse_of: 'client'
  has_many :products, through: :purchases
  validates_uniqueness_of :documento, :message => "documento already exists"
  validates :nombres, :documento, presence: true
end
