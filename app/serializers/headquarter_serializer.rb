class HeadquarterSerializer < ActiveModel::Serializer
  attributes :nombre, :direccion

  def nombre
    object.sede
  end
end
