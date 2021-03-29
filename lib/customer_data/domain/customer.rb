module CustomerData
  module Domain
    Customer = Struct.new(:latitude, :longitude, :name, :user_id) do
      def lat
        latitude
      end

      def lon
        longitude
      end
    end
  end
end