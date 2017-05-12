module ZionData
  module Parser
    # Class for parsing Zion loopholes data
    class Loopholes
      include Helpers

      attr_reader :routes, :node_pairs

      def initialize(routes:, node_pairs:)
        @routes = JSON.parse(routes)['routes']
        @node_pairs = JSON.parse(node_pairs)['node_pairs']
      end

      def parse
        routes.each_with_object([]) do |route, result|
          node_pair = find_node_pair(route['node_pair_id'])
          next unless node_pair
          result << payload(node_pair['start_node'], node_pair['end_node'],
                            route['start_time'], route['end_time'])
        end
      end

      private

      def find_node_pair(node_pair_id)
        node_pairs.find { |np| np['id'] == node_pair_id }
      end
    end
  end
end
