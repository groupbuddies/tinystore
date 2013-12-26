module Repositories
  module Orders
    class Memory
      def initialize
        @orders = {}
        @next_id = 1
      end

      def clear
        initialize
      end

      def all
        orders.values
      end

      def save(order)
        order.id = @next_id
        @orders[@next_id] = order
        @next_id += 1
        order
      end

      def find_by_id(id)
        @orders[id]
      end

      private
      attr_reader :orders
    end
  end
end
