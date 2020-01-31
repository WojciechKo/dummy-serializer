# Dummy::Serializer

Serializer built to practice building custom DSL.

# Usage

```ruby
require 'dummy-serializer'
require 'ostruct'

object = OpenStruct.new(id: 123, name: 'Ruby', age: 27)

class ObjectSerializer < Dummy::Serializer
  attribute :id
  attribute :display_name do
    "#{object.name} - #{object.age}"
  end
end

ObjectSerializer.new(object).serialize # { id: 123, display_name: 'Ruby - 27' }
```
