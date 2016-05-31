class Client < ActiveRecord::Base
  self.table_name = "clientes"
  validates_uniqueness_of :documento, :message => "documento already exists"
  validates :nombres, :documento, presence: true
end
