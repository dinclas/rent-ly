# frozen_string_literal: true

module Fipe
  class Service
    class UnexpectedResponse < StandardError; end

    class << self
      def list_brands
        response = RestClient.get('http://fipeapi.appspot.com/api/1/carros/marcas.json')
        raise UnexpectedResponse unless response.code == 200

        JSON.parse(response.body)
      end

      def list_models(brand_id)
        response = RestClient.get("http://fipeapi.appspot.com/api/1/carros/veiculos/#{brand_id}.json")
        raise UnexpectedResponse unless response.code == 200

        JSON.parse(response.body)
      end
    end
  end
end
