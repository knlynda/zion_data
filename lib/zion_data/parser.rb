module ZionData
  # Namespace for Zion data parsers
  module Parser
    class << self
      def parse(source, data)
        [].tap do |result|
          Zip::File.open_buffer(data) do |zip|
            params = zip_entries_data(zip)
            result.push(*get_source_const(source).new(params).parse)
          end
        end
      end

      private

      def basename(file_name)
        File.basename(file_name).gsub(/\..+$/, '').to_sym
      end

      def get_source_const(name)
        Object.const_get([self.name, name.capitalize].join('::'))
      end

      def zip_entries_data(zip)
        zip.select { |e| e.file? && e.name =~ %r{\w+/\w+\.\w+} }
           .each_with_object({}) do |entry, result|
          result[basename(entry.name)] = entry.get_input_stream.read
        end
      end
    end
  end
end
