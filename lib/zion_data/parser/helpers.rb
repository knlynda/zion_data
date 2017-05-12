module ZionData
  module Parser
    # Helpers module for parsing Zion data
    module Helpers
      TIME_FORMAT = '%FT%T'.freeze

      private

      def parse_csv(csv_string)
        options = { headers: true, converters: :numeric, col_sep: ', ' }
        CSV.parse(csv_string, options).map(&:to_hash)
      end

      def convert_time(time_string)
        DateTime.parse(time_string).to_time.utc.strftime(TIME_FORMAT)
      end

      def payload(start_node, end_node, start_time, end_time)
        {
          start_node: start_node,
          end_node: end_node,
          start_time: convert_time(start_time),
          end_time: convert_time(end_time)
        }
      end
    end
  end
end
