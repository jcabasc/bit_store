class ProductSerializer < ActiveModel::Serializer
  attributes :nombre, :precio, :descripcion

  def nombre
    object.producto
  end
end
