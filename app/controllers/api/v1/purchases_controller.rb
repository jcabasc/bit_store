module API
  module V1
    class PurchasesController < APIController

      private

      def purchase_params
        params.require(:purchase).permit(:id_cliente, :id_producto, :id_sede, :precio, :descripcion).merge(fecha: Time.now)
      end
    end
  end
end
