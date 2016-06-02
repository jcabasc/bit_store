module API
  module V1
    class ProductsController < APIController

      private

      def product_params
        params.require(:product).permit(:producto, :precio, :descripcion)
      end
    end
  end
end
