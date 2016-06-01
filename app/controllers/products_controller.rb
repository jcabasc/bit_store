class ProductsController < BaseController
  expose(:product, attributes: :product_params, finder_parameter: :id)
  expose(:products)

  def product_params
    params.require(:product).permit(:producto, :precio, :descripcion)
  end
end
