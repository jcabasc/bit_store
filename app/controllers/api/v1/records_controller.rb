module API
  module V1
    class RecordsController < APIController

      private

      def record_params
        params.require(:record).permit(:title, :date, :amount)
      end
    end
  end
end
