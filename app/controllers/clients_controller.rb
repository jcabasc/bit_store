class ClientsController < BaseController
  expose(:client, attributes: :client_params, finder_parameter: :id)
  expose(:clients)

  def client_params
    params.require(:client).permit(:nombres, :documento, :detalles)
  end
end
