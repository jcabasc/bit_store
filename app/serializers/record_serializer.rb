class RecordSerializer < ActiveModel::Serializer
  attributes :id, :title, :amount, :date

  def date
    object.date.strftime('%a, %d of %b')
  end
end
