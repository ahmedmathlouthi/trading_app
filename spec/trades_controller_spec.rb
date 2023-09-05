require "rails_helper"
require "spec_helper"

describe TradesController, :type => :controller do
  render_views

  describe '#index' do
    let!(:trade) { create(:trade) }
    subject(:get_trades) { get :index, format: :json }

    it 'render trades' do
      get_trades

      expect(response.parsed_body).to match(
        a_hash_including(
          'trades' => a_collection_containing_exactly(
            'id' => trade.id,
            'time' => trade.time.iso8601,
            'value' => trade.value.to_s,
          )
        )
      )
    end
  end

  describe '#generate_gain' do
    let(:date) { Date.current.yesterday }
    let!(:trade_1) { create(:trade, value: 100.12, time: date.beginning_of_day + 1.hour) } 
    let!(:trade_2) { create(:trade, value: 100.10, time: date.beginning_of_day + 2.hours) }

    subject(:get_trades) { get :generate_gain, format: :json, params: { date: date } }

    it 'returns maximum gain' do
      get_trades

      expect(response.parsed_body).to match(
        a_hash_including(
          'gain' => '0.04',
      ))
    end
  end
end