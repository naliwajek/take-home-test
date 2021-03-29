require 'net/http'

module CustomerData
  module Gateway
    class CustomersFileByUrl
      def initialize(file_url:)
        @file_url = URI(file_url)
      end

      def fetch_customers_locations_json
        Net::HTTP.get(file_url).strip.split(/\n/).map do |b|
          JSON.parse(b).transform_keys(&:to_sym)
        end
      end

      private

      attr_reader :file_url
    end
  end
end