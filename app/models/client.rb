class Client < ActiveRecord::Base
  include EventRecorder
  self.table_name = "clientes"
  has_many :purchases, foreign_key: "id_cliente", dependent: :destroy, inverse_of: 'client'
  has_many :products, through: :purchases
  validates_uniqueness_of :documento, :message => "documento already exists"
  validates :nombres, :documento, presence: true

  def total_price
    purchases.inject(0) do |total, p|
      value = if p.precio.present?
                p.precio
              else
                p.product.try(:precio).to_i
              end
      total + value
    end
  end
end
