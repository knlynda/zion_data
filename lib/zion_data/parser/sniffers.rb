module ZionData
  module Parser
    # Class for parsing Zion sniffers data
    class Sniffers
      include Helpers

      attr_reader :routes, :node_times, :sequences

      def initialize(routes:, node_times:, sequences:)
        @routes = parse_csv(routes)
        @node_times = parse_csv(node_times)
        @sequences = parse_csv(sequences)
      end

      def parse
        sequences.each_with_object([]) do |sequence, result|
          route = find_route(sequence['route_id'])
          node_time = find_node_time(sequence['node_time_id'])
          next unless route && node_time

          result << payload(node_time['start_node'], node_time['end_node'],
                            route['time'], end_time(route['time'], node_time))
        end
      end

      private

      def end_time(time_string, node_time)
        start_time = DateTime.parse(time_string).to_time.utc
        end_time = start_time + node_time['duration_in_milliseconds'] / 1000
        end_time.to_s
      end

      def find_route(route_id)
        routes.find { |r| r['route_id'] == route_id }
      end

      def find_node_time(node_time_id)
        node_times.find { |r| r['node_time_id'] == node_time_id }
      end
    end
  end
end
