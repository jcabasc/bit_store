module API
  module V1
    class ClientsController < APIController

      private

      def client_params
        params.require(:client).permit(:nombres, :documento, :detalles)
      end
    end
  end
end
