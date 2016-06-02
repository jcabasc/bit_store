module API
  module V1
    module ErrorHandler
      extend ActiveSupport::Concern
      JSON_API_STATUS_CODES = {
        RECORD_NOT_FOUND: 404,
        UNPROCESSABLE_ENTITY: 422,
        INTERNAL_SERVER_ERROR: 500
      }

      included do
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        rescue_from ActiveRecord::StatementInvalid, with: :show_errors
        rescue_from ActionController::ParameterMissing, with: :invalid_request
      end

      private

      def manage_exceptions(code, exception = nil, record = nil, title = nil)
        if exception
          logger.error exception.message
          logger.error exception.backtrace.to_sentence
        end
        render json: { status: code, errors: [ format_error(code, exception.try(:message), record, title) ] }
      end

      def format_error(code, detail, record = nil, title = nil)
        {
          id: record.try(:id),
          status: code,
          title:  title || Rack::Utils::HTTP_STATUS_CODES[code.to_i],
          detail: detail
        }
      end

      def invalid_request(exception)
        manage_exceptions(JSON_API_STATUS_CODES[:UNPROCESSABLE_ENTITY], exception)
      end

      def record_not_found(exception)
        manage_exceptions(JSON_API_STATUS_CODES[:RECORD_NOT_FOUND], exception)
      end

      def show_errors(exception)
        manage_exceptions(JSON_API_STATUS_CODES[:INTERNAL_SERVER_ERROR], exception, exception.try(:record))
      end
    end
  end
end
