module Geo
  module UseCase
    class CalculateInRange
      EARTH_RADIUS = 6371.freeze

      def initialize(source_lat:, source_lon:, target_lat:, target_lon:)
        @delta_lat = as_radians(source_lat - target_lat)
        @delta_lon = as_radians(source_lon - target_lon)
        @source_lat = as_radians(source_lat)
        @source_lon = as_radians(source_lon)
        @target_lat = as_radians(target_lat)
        @target_lon = as_radians(target_lon)
      end

      def call(in_range_of_km:)
        EARTH_RADIUS * calculate_haversine_formula! <= in_range_of_km
      end

      private

      def as_radians(degrees)
        degrees * Math::PI / 180
      end

      def calculate_haversine_formula!
        a = Math.sin(delta_lat/2)**2 + Math.cos(source_lat) * Math.cos(target_lat) * Math.sin(delta_lon/2)**2
        2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
      end

      attr_reader :source_lat, :source_lon, :target_lat, :target_lon,
                  :delta_lat, :delta_lon
    end
  end
end