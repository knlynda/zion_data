module ZionData
  module Parser
    # Class for parsing Zion sentinels data
    class Sentinels
      ROUTE_GROUP_SIZE = 2

      include Helpers

      attr_reader :routes

      def initialize(routes:)
        @routes = parse_csv(routes)
      end

      def parse
        route_groups.map do |first, last|
          payload(first['node'], last['node'], first['time'], last['time'])
        end
      end

      private

      def route_groups
        routes.sort_by { |r| r['route_id'] }.group_by { |r| r['index'] }.values
              .select { |r| r.size == ROUTE_GROUP_SIZE }
      end
    end
  end
end
