module ZionData
  # Class for communication with zion server
  module Client
    ZION_URL = 'http://challenge.distribusion.com/the_one/routes'.freeze
    PASS_PHRASE = 'Kans4s-i$-g01ng-by3-bye'.freeze

    class << self
      def get_source(source)
        puts "=== Get #{source}"
        client.get(params: { source: source, passphrase: PASS_PHRASE }).body
      end

      def post_source_data(source, payload)
        puts "=== Post #{source} data: #{payload}"
        data = client.post(payload.merge(source: source, passphrase: PASS_PHRASE)).body
        messages = eval(data)
        puts(messages.map { |k, v| "    #{k} -> #{v}" }) if messages.respond_to?(:map)
      end

      private

      def client
        @client ||= RestClient::Resource.new(ZION_URL)
      end
    end
  end
end
