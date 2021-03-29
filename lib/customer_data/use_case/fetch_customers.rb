module CustomerData
  module UseCase
    class FetchCustomers
      def initialize(customer_gateway: nil)
        @customer_gateway = customer_gateway
      end

      def call
        customers = customer_gateway.fetch_customers_locations_json
        customers.map do |customer|
          ::CustomerData::Domain::Customer.new(
            customer[:latitude].to_f,
            customer[:longitude].to_f,
            customer[:name],
            customer[:user_id].to_i
          )
        end
      end

      private

      attr_reader :customer_gateway
    end
  end
end