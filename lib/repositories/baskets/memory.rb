module Repositories
  module Baskets
    class Memory
      def initialize
        @baskets = {}
      end

      def clear
        initialize
      end

      def all
        @baskets.values
      end

      def add(product_id: nil, customer_id: nil)
        raise 'Needs customer id to add to basket' unless customer_id
        @baskets[customer_id] ||= []
        @baskets[customer_id] << product_id
      end

      def all_products_for(customer_id: nil)
        @baskets[customer_id] || []
      end
    end
  end
end
