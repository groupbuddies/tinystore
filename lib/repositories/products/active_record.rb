require 'active_record'

module Repositories
  module Products
    class ActiveRecord
      def clear
        Product.destroy_all
      end

      def all
        Product.all.map do |product|
          ::Product.new product.value
        end
      end

      def save(product)
        ::Product.new(new_or_updated_product(product).value)
      end

      def all_products_for(store_id: store_id)
        Product.where(store_id: store_id).map do |product|
          ::Product.new product.value
        end
      end

      private
      def new_or_updated_product(product)
        product.id ? update_existing(product) : create(product)
      end

      def update_existing(product)
        if existing_product = Product.find(product.id)
          existing_product.update_attributes product.value
        end
      end

      def create(product)
        Product.create product.value
      end

      class Product < ::ActiveRecord::Base
        def value(serializer: Serializers::Raw)
          serializer.new(self).serialize
        end
      end
    end
  end
end
