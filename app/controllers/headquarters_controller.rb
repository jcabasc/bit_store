class HeadquartersController < BaseController
  expose(:headquarter, attributes: :headquarter_params, finder_parameter: :id)
  expose(:headquarters)

  def headquarter_params
    params.require(:headquarter).permit(:sede, :direccion)
  end
end
