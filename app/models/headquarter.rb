class Headquarter < ActiveRecord::Base
  self.table_name = "sedes"
  validates :sede, :direccion, presence: true
end
