module Invites
  module Presenter
    class InvitesAsTxt
      HEADLINE = 'List of customers to invite for drinks:'.freeze

      def initialize(attributes:, sort_key:)
        @attributes = attributes
        @sort_key = sort_key
      end

      def present(customers:)
        presentable_customers = customers.sort_by do |c|
          c.public_send(sort_key)
        end.map do |c|
          customer_to_presentable(c)
        end.join("\n")

        "#{HEADLINE}\n#{presentable_customers}".strip
      end

      private

      def customer_to_presentable(customer)
        customer_as_text = String.new

        attributes.each do |a|
          customer_as_text += "#{a}: #{customer.public_send(a)}, "
        end

        customer_as_text.gsub(/,\s+$/, '')
      end

      attr_reader :attributes, :sort_key
    end
  end
end