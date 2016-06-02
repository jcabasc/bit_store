class LogSerializer < ActiveModel::Serializer
  attributes :fecha, :descripcion

  def fecha
    object.fecha.strftime("%m/%d/%Y %H:%M") unless object.fecha.nil?
  end
end
