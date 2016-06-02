class Log < ActiveRecord::Base
  self.table_name = "log"
  validates :descripcion, presence: true
end
