module Dummy
  class Serializer
    module Attributes
      DEFAULT_RESOLVER = ->(attribute, object) { object.send(attribute) }

      def attribute(name, resolver = nil, &block)
        attributes[name] = resolver || block || DEFAULT_RESOLVER.curry[name]
      end

      def attributes
        @attributes ||= {}
      end
    end
  end
end

