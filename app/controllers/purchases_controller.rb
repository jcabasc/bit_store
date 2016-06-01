class PurchasesController < BaseController
  expose(:purchase, attributes: :purchase_params, finder_parameter: :id)
  expose(:purchases) { Purchase.includes(:client, :product) }

  def purchase_params
    params.require(:purchase).permit(:id_cliente, :id_producto, :id_sede, :precio, :descripcion).merge(fecha: Time.now)
  end
end
