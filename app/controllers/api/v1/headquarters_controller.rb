module API
  module V1
    class HeadquartersController < APIController

      private

      def headquarter_params
        params.require(:headquarter).permit(:sede, :direccion)
      end
    end
  end
end
