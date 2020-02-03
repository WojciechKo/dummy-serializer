require 'dummy-serializer'
require 'ostruct'

RSpec.describe Dummy::Serializer do
  subject(:serialize) { serializer_class.new(object).serialize }

  let(:object) { OpenStruct.new(id: 123, name: 'Ruby', age: 27) }

  describe '::attribute' do
    context 'without provided block' do
      let(:serializer_class) do
        Class.new(described_class) do
          attribute :id
          attribute :name
        end
      end

      it 'returns attributes from the object under serialization' do
        expect(serialize).to eq(
          id: 123,
          name: 'Ruby'
        )
      end
    end

    context 'with provided block' do
      context 'when block does not require access to the object under serialization' do
        let(:serializer_class) do
          Class.new(described_class) do
            attribute :name do
              'hello'
            end
          end
        end

        it 'returns the result of the provided block as an arttribute value' do
          expect(serialize).to eq(
            name: 'hello'
          )
        end
      end

      context 'when block requires access to the object under serialization' do
        let(:serializer_class) do
          Class.new(described_class) do
            attribute :custom do
              object.id
            end
          end
        end

        it 'can refer to it as `object`' do
          expect(serialize).to eq(
            custom: 123
          )
        end
      end

      describe 'block accepts an argument' do
        let(:serializer_class) do
          Class.new(described_class) do
            attribute :object_id, ->(object) { object.object_id }
          end
        end

        it 'passes the object under serialization as an argument to the block' do
          expect(serialize).to eq(
            object_id: object.object_id
          )
        end
      end
    end

    context 'inheritance' do
      let(:base_class) do
        Class.new(described_class) do
          attribute :id
        end
      end

      context 'extend existing serializer' do
        let(:serializer_class) do
          Class.new(base_class) do
            attribute :name
          end
        end

        it 'returns values for attributes defined in base and child class' do
          expect(serialize).to eq(
            id: 123,
            name: 'Ruby'
          )
        end
      end

      context 'override attribute definition' do
        let(:serializer_class) do
          Class.new(base_class) do
            attribute :id do
              42
            end
          end
        end

        it 'returns value as defined in child serilizer' do
          expect(serialize).to eq(
            id: 42
          )
        end
      end
    end
  end
end
