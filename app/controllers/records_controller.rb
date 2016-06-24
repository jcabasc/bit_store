class RecordsController < BaseController
  expose(:record, attributes: :record_params, finder_parameter: :id)
  expose(:records)

  def record_params
    params.require(:record).permit(:title, :date, :amount)
  end
end
