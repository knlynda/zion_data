require 'spec_helper'

RSpec.describe ZionData::Parser::Sentinels do
  describe '#parse' do
    subject { described_class.new(routes: routes).parse }

    context 'when correct data given' do
      let(:routes) do
        '"route_id", "node", "index", "time"
"1", "alpha", "0", "2030-12-31T22:00:01+09:00"
"2", "delta", "0", "2030-12-31T22:00:02+09:00"'
      end

      let(:expected_data) do
        [
          {
            start_node: 'alpha',
            end_node: 'delta',
            start_time: '2030-12-31T13:00:01',
            end_time: '2030-12-31T13:00:02'
          }
        ]
      end

      it { is_expected.to eql(expected_data) }
    end

    context 'when empty data given' do
      let(:routes) { '"route_id", "node", "index", "time"' }

      it { is_expected.to be_empty }
    end
  end
end
