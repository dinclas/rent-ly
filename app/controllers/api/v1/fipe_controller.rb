module Api
  module V1
    class FipeController < ApplicationController
      def brands
        render json: Fipe::Service.list_brands
      end

      def models
        render json: Fipe::Service.list_models(params.require(:brand_id))
      end
    end
  end
end