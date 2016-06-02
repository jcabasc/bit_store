class ClientSerializer < ActiveModel::Serializer
  attributes :id, :nombres, :documento, :detalles
end
