require_relative '../lib/linkedlist'

describe LinkedList::LinkedList do
  subject(:ll) { LinkedList::LinkedList.new }

  describe '#append' do
  end
  describe '#prepend' do
  end
  describe '#insert_at' do
  end
  describe '#size' do
    it 'append increases size by 1' do
      expect { ll.append(0) }.to change { ll.size }.by(1)
    end
    it 'prepend increases size by 1' do
      expect { ll.prepend(0) }.to change { ll.size }.by(1)
    end

    let(:arr) { Array.new(10) { rand(10) } }
    it 'insert_at increases size by value length (value is linked list)' do
      expect { ll.insert_at(0, 0) }.to change { ll.size }.by(1)
      expect { ll.insert_at(0, 0, 1) }.to change { ll.size }.by(2)
      expect { ll.insert_at(0, arr) }.to change { ll.size }.by(10)
    end
    it 'remove_at decreases size by 1' do
      expect { ll.remove_at(0) }.to change { ll.size }.by(-1)
    end
    it 'pop decreases size by 1' do
      expect { ll.pop }.to change { ll.size }.by(-1)
    end
  end
  describe '#at' do
  end
  describe '#pop' do
  end
  describe '#remove_at' do
  end
  describe '#index' do
  end
  describe '#to_s' do
  end
  describe '#to_a' do
    loaders = {
      append: ->(obj, value) { obj.append(value) },
      prepend: ->(obj, value) { obj.prepend(value) }
    }

    let(:arr1) { (0...4).to_a }
    let(:arr2) { (0...4).to_a.map { |i| (i + 'a'.ord).chr } }
    it 'returns [] on empty list' do
      expect(ll.to_a).to eql([])
    end

    loaders.each_pair do |name, loader|
      context "using #{name}" do
        if name == :append
          it 'returns one value' do
            loader.call(ll, arr1[0])
            expect(ll.to_a).to eql(arr1.slice(0, 1))
          end
        else
          it 'returns one value' do
            loader.call(ll, arr1[0])
            expect(ll.to_a.reverse).to eql(arr1.slice(0, 1))
          end
        end

        if name == :append
          it 'returns two values' do
            loader.call(ll, arr2[0])
            loader.call(ll, arr2[1])
            expect(ll.to_a).to eql(arr2.slice(0, 2))
          end
        else
          it 'returns two values' do
            loader.call(ll, arr2[0])
            loader.call(ll, arr2[1])
            expect(ll.to_a.reverse).to eql(arr2.slice(0, 2))
          end
        end

        if name == :append
          it 'returns all values in array form' do
            arr1.each { |elem| loader.call(ll, elem) }
            arr2.each { |elem| loader.call(ll, elem) }
            expect(ll.to_a).to eql(arr1 + arr2)
          end
        else
          it 'returns all values in array form' do
            arr1.each { |elem| loader.call(ll, elem) }
            arr2.each { |elem| loader.call(ll, elem) }
            expect(ll.to_a.reverse).to eql(arr1 + arr2)
          end
        end
      end
    end
  end

  describe '#contains' do
  end
  describe '#empty' do
    it 'returns true on empty list' do
      expect(ll).to be_empty
    end

    it 'returns false otherwise' do
      ll.append(0)
      expect(ll).not_to be_empty
    end
  end
end
