class PurchaseSerializer < ActiveModel::Serializer
  attributes :client, :product, :id_sede, :precio, :descripcion, :fecha

  def fecha
    object.fecha.strftime("%m/%d/%Y %H:%M") unless object.fecha.nil?
  end

end
