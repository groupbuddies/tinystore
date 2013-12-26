module Repositories
  module Stores
    class Memory
      def initialize
        @stores = {}
        @next_id = 1
      end

      def clear
        initialize
      end

      def all
        @stores.values
      end

      def save(store)
        store.id = @next_id
        @stores[@next_id] = store
        @next_id += 1
        store
      end

      def find_by_id(id)
        @stores[id]
      end

      def unique?(object, attr_name)
        @stores.values.none? do |store|
          object.id != store.id && store.public_send(attr_name) == object.public_send(attr_name)
        end
      end
    end
  end
end
