# frozen_string_literal: true

class VehiclesController < ApplicationController
  def search
    # TODO: Migrate to ElasticSearch
    result = Vehicle.where('brand ilike ?', query)
                    .or(Vehicle.where('model ilike ?', query))
                    .limit(30)

    respond_to do |format|
      format.json { render json: result }
    end
  end

  private

  def query
    params.require(:query)
  end
end
