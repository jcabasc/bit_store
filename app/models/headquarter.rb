class Headquarter < ActiveRecord::Base
  include EventRecorder
  self.table_name = "sedes"
  validates :sede, :direccion, presence: true
end
