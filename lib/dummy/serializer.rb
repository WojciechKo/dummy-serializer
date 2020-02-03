require 'dummy/serializer/attributes'

module Dummy
  class Serializer
    extend Attributes

    def initialize(object)
      @object = object
    end

    def serialize
      self.class.ancestors
        .grep(Attributes)
        .reverse
        .map(&:attributes)
        .reduce(:merge)
        .transform_values(&resolve_attributes)
    end

    attr_reader :object

    private

    def resolve_attributes
      ->(resolver) { instance_exec(object, &resolver) }
    end
  end
end
