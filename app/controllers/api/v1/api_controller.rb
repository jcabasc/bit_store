module API
  module V1
    class APIController < ActionController::Base
      include API::V1::ErrorHandler

      def index
        render json: resource_class.all
      end

      def create
        resource = resource_class.new(permitted_params)
        save(resource)
      end

      def update
        resource = resource_class.find(finder_param)
        resource.assign_attributes(permitted_params)
        save(resource)
      end

      def show
        resource = resource_class.find(finder_param)
        render json: resource
      end

      def destroy
        resource = resource_class.find(finder_param)
        resource.destroy
        head :no_content
      end

      protected

      def finder_param
        params.require(:id)
      end

      def save(resource)
        if resource.save
          render json: resource
        else
          render json: { errors: resource.errors }, status: 422
        end
      end

      def permitted_params
        send("#{resource_name}_params")
      end

      def resource_class
        controller_name.classify.constantize
      end

      def resource_name
        controller_name.singularize.downcase
      end
    end
  end
end
