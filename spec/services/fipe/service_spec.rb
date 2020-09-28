# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fipe::Service do
  describe '#list_brands' do
    context 'when response is 200' do
      let!(:response) { OpenStruct.new(code: 200, body: '{}') }
      it 'returns the parsed body' do
        expect(RestClient).to receive(:get).with('http://fipeapi.appspot.com/api/1/carros/marcas.json')
                                .and_return(response)
        expect(Fipe::Service.list_brands).to eq({})
      end
    end

    context 'when response is 500' do
      let!(:response) { OpenStruct.new(code: 500, body: '{}') }
      it 'raises Fipe::Service::UnexpectedResponse' do
        expect(RestClient).to receive(:get).with('http://fipeapi.appspot.com/api/1/carros/marcas.json')
                                .and_return(response)
        expect { Fipe::Service.list_brands }.to raise_error(Fipe::Service::UnexpectedResponse)
      end
    end
  end

  describe '#list_models' do
    context 'when brand_id is 21' do
      let!(:brand_id) { 21 }

      context 'and response is 200' do
        let!(:response) { OpenStruct.new(code: 200, body: '{}') }

        it 'returns the parsed body' do
          expect(RestClient).to receive(:get).with("http://fipeapi.appspot.com/api/1/carros/veiculos/#{brand_id}.json")
                                  .and_return(response)
          expect(Fipe::Service.list_models(brand_id)).to eq({})
        end
      end

      context 'and response is 404' do
        let!(:response) { OpenStruct.new(code: 404, body: '{}') }

        it 'raises Fipe::Service::UnexpectedResponse' do
          expect(RestClient).to receive(:get).with("http://fipeapi.appspot.com/api/1/carros/veiculos/#{brand_id}.json")
                                  .and_return(response)
          expect { Fipe::Service.list_models(brand_id) }.to raise_error(Fipe::Service::UnexpectedResponse)
        end
      end
    end
  end
end
