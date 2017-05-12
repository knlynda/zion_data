require 'spec_helper'

RSpec.describe ZionData::Parser::Sniffers do
  describe '#parse' do
    subject { described_class.new(routes: routes, node_times: node_times, sequences: sequences).parse }

    context 'when correct data given' do
      let(:routes) do
        '"route_id", "time", "time_zone"
"1", "2030-12-31T13:00:06", "UTC±00:00"'
      end

      let(:node_times) do
        '"node_time_id", "start_node", "end_node", "duration_in_milliseconds"
"1", "lambda", "tau", "1000"'
      end

      let(:sequences) do
        '"route_id", "node_time_id"
"1", "1"'
      end

      let(:expected_data) do
        [
          {
            start_node: 'lambda',
            end_node: 'tau',
            start_time: '2030-12-31T13:00:06',
            end_time: '2030-12-31T13:00:07'
          }
        ]
      end

      it { is_expected.to eql(expected_data) }
    end

    context 'when empty data given' do
      let(:routes) do
        '"route_id", "time", "time_zone"'
      end

      let(:node_times) do
        '"node_time_id", "start_node", "end_node", "duration_in_milliseconds"'
      end

      let(:sequences) do
        '"route_id", "node_time_id"'
      end

      it { is_expected.to be_empty }
    end
  end
end
