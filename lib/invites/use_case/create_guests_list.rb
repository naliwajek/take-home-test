module Invites
  module UseCase
    class CreateGuestsList
      INTERCOM_OFFICE_LAT = 53.339428.freeze
      INTERCOM_OFFICE_LON = -6.257664.freeze

      def initialize(customer_file:, presenter:)
        @customer_file = customer_file
        @presenter = presenter
      end

      def call(in_range_of_km:)
        customers = CustomerData::UseCase::FetchCustomers.new(
          customer_gateway: CustomerData::Gateway::CustomersFileByUrl.new(file_url: customer_file)
        ).call

        customers_in_range = customers.select do |customer|
          Geo::UseCase::CalculateInRange.new(
            source_lat: INTERCOM_OFFICE_LAT,
            source_lon: INTERCOM_OFFICE_LON,
            target_lat: customer.lat,
            target_lon: customer.lon
          ).call(in_range_of_km: in_range_of_km)
        end

        presenter.present(customers: customers_in_range)
      end

      private

      attr_reader :customer_file, :presenter, :in_range_of_km
    end
  end
end