require 'spec_helper'

RSpec.describe ZionData::Parser::Loopholes do
  describe '#parse' do
    subject { described_class.new(routes: routes, node_pairs: node_pairs).parse }

    context 'when correct data given' do
      let(:routes) do
        '{"routes":[{
         "route_id":"1",
         "node_pair_id":"1",
         "start_time":"2030-12-31T13:00:04Z",
         "end_time":"2030-12-31T13:00:05Z"}]}'
      end

      let(:node_pairs) do
        '{"node_pairs":[{
         "id":"1",
         "start_node":"gamma",
         "end_node":"theta"}]}'
      end

      let(:expected_data) do
        [
          {
            start_node: 'gamma',
            end_node: 'theta',
            start_time: '2030-12-31T13:00:04',
            end_time: '2030-12-31T13:00:05'
          }
        ]
      end

      it { is_expected.to eql(expected_data) }
    end

    context 'when empty data given' do
      let(:routes) { '{"routes":[]}' }
      let(:node_pairs) { '{"node_pairs":[]}' }

      it { is_expected.to be_empty }
    end
  end
end
