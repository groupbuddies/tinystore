require 'active_record'

module Repositories
  module Stores
    class ActiveRecord
      def clear
        Store.destroy_all
      end

      def all
        Store.all.map do |store|
          ::Store.new store.value
        end
      end

      def save(store)
        ::Store.new(new_or_updated_store(store).value)
      end

      def find_by_id(id)
        Store.find(id)
      end

      def unique?(object, attr_name)
        Store.where(attr_name => object.public_send(attr_name)).where.not(id: object.id).none?
      end

      private
      def new_or_updated_store(store)
        store.id ? update_existing(store) : create(store)
      end

      def update_existing(store)
        if existing_store = Store.find(store.id)
          existing_store.update_attributes store.value
        end
      end

      def create(store)
        Store.create store.value
      end

      class Store < ::ActiveRecord::Base
        def value(serializer: Serializers::Raw)
          serializer.new(self).serialize
        end
      end
    end
  end
end
