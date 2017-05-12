require 'json'
require 'csv'
require 'zip'
require 'rest-client'
require 'zion_data/client'
require 'zion_data/parser'
require 'zion_data/parser/helpers'
require 'zion_data/parser/loopholes'
require 'zion_data/parser/sentinels'
require 'zion_data/parser/sniffers'
require 'zion_data/version'

# Base namespace of the gem
module ZionData
  SOURCES = %w[loopholes sentinels sniffers].freeze

  module_function

  def send_corrected_sources
    sources.each do |source, data|
      data.each { |di| Client.post_source_data(source, di) }
    end
  end

  def sources
    SOURCES.each_with_object({}) do |source, result|
      result[source] = Parser.parse(source, Client.get_source(source))
    end
  end
end
