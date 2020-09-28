require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe '#name' do
    let!(:vehicle) { create(:vehicle) }
    subject { vehicle.name }

    it { is_expected.to eq("#{vehicle.brand} - #{vehicle.model} - #{vehicle.model_year}") }
  end
end
