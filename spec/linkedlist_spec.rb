require_relative '../lib/linkedlist'

describe LinkedList::LinkedList do
  subject(:ll) { LinkedList::LinkedList.new }

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
      # expect { ll.insert_at(0, 0, 1) }.to change { ll.size }.by(2)
      # expect { ll.insert_at(0, arr) }.to change { ll.size }.by(arr.length)
    end
    it 'remove_at(0) decreases size by 1' do
      ll.append(0)
      expect { ll.remove_at(0) }.to change { ll.size }.by(-1)
    end
    it 'pop decreases size by 1' do
      ll.append('test')
      expect { ll.pop }.to change { ll.size }.by(-1)
    end
  end
  describe '#at' do
  end
  describe '#pop' do
    let(:arr1) { (0...10).to_a }
    let(:arr2) { (0...10).to_a.map { |i| (i + 'a'.ord).chr } }

    it 'returns nil on an empty list' do
      expect(ll.pop).to be_nil
      expect(ll.size).to be_zero
    end

    it 'returns the head node value with each call' do
      arr1.each do |value|
        ll.prepend(value)
      end
      until ll.empty?
        result = ll.pop
        val = arr1.pop
        expect(result).to eql(val)
      end
    end
  end
  describe '#index' do
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
  describe '#remove_at' do
    let(:arr) { (0...10).to_a }
    it 'remove single node' do
      ll.append(0)
      result = ll.remove_at(0)
      expect(result).to eql(0)
      expect(ll).to be_empty
      expect(ll.to_a).to eql([])
    end
    it 'remove first node' do
      arr.each { |i| ll.append(i) }
      result = ll.remove_at(0)
      expect(result).to eql(0)
      expect(ll.to_a).to eql((1...10).to_a)
    end
    it 'remove 2 of 2 nodes starting at head' do
      ll.append(0)
      ll.append(1)
      result = ll.remove_at(0)
      expect(result).to eql(0)
      expect(ll.to_a).to eql([1])
      result = ll.remove_at(0)
      expect(result).to eql(1)
      expect(ll.to_a).to eql([])
    end
    it 'remove 2 of 2 nodes starting at tail' do
      ll.append(0)
      ll.append(1)
      result = ll.remove_at(-1)
      expect(result).to eql(1)
      expect(ll.to_a).to eql([0])
      result = ll.remove_at(-1)
      expect(result).to eql(0)
      expect(ll.to_a).to eql([])
    end
    it 'remove first node' do
      arr.each { |i| ll.append(i) }
      result = ll.remove_at(0)
      expect(result).to eql(0)
      arr_comp = arr.dup
      arr_comp.delete_at(0)
      expect(ll.to_a).to eql(arr_comp)
    end
    it 'remove center node' do
      arr.each { |i| ll.append(i) }
      result = ll.remove_at(5)
      expect(result).to eql(5)
      arr_comp = arr.dup
      arr_comp.delete_at(5)
      expect(ll.to_a).to eql(arr_comp)
    end
    it 'remove last node' do
      arr.each { |i| ll.append(i) }
      result = ll.remove_at(-1)
      expect(result).to eql(9)
      arr_comp = arr.dup
      arr_comp.delete_at(-1)
      expect(ll.to_a).to eql(arr_comp)
    end
    it 'raise error if index < -1' do
      arr = (0...10).to_a
      arr.each { |i| ll.append(i) }
      expect { ll.remove_at(-2) }.to raise_error(IndexError)
    end
    it 'raise error unless index <= size' do
      arr = (0...10).to_a
      arr.each { |i| ll.append(i) }
      expect { ll.remove_at(arr.length) }.to raise_error(IndexError)
    end
  end
  describe '#insert_at' do
    context 'single node insertion' do
      it 'insert first node from head, start with empty list.' do
        result = ll.insert_at(0, 0)
        expect(result).to eql(0)
        expect(ll.to_a).to eql([0])
      end
      it 'insert 2 nodes from head, start with empty list.' do
        ll.insert_at(0, 0)
        ll.insert_at(0, 1)
        expect(ll.to_a).to eql([1, 0])
      end
      it 'insert 3rd node from head, start with empty list.' do
        ll.insert_at(0, 0)
        ll.insert_at(0, 1)
        ll.insert_at(0, 2)
        expect(ll.to_a).to eql([2, 1, 0])
      end
      it 'insert single node from tail, start with empty list.' do
        result = ll.insert_at(-1, 0)
        expect(result).to eql(0)
        expect(ll.to_a).to eql([0])
      end
      it 'insert 2 nodes from tail, start with empty list.' do
        ll.insert_at(-1, 0)
        ll.insert_at(-1, 1)
        expect(ll.to_a).to eql([0, 1])
      end
      it 'insert 3rd node from tail, start with empty list.' do
        ll.insert_at(-1, 0)
        ll.insert_at(-1, 1)
        ll.insert_at(-1, 2)
        expect(ll.to_a).to eql([0, 1, 2])
      end
      it 'insert mid list' do
        arr = (0...10).to_a
        arr.each { |i| ll.append(i) }
        ll.insert_at(5, 100)
        expect(ll.to_a).to eql(arr.insert(5, 100))
      end
      it 'testing out of bound index -2' do
        arr = (0...10).to_a
        arr.each { |i| ll.append(i) }
        expect { ll.insert_at(-2, 100) }.to raise_error(IndexError)
      end
      it 'testing out of bound index - size of list' do
        arr = (0...10).to_a
        arr.each { |i| ll.append(i) }
        expect { ll.insert_at(ll.size, 100) }.to raise_error(IndexError)
      end
    end
  end
  describe '#insert_at / #remove_at' do
    let(:arr) { Array.new(10) { rand(10) } }
    it 'systematically test insert_at, delete_at' do
      arr.each { |i| ll.append(i) }

      arr.length.times do |i|
        ll.insert_at(i, 100)
        arr.insert(i, 100)
        expect(ll.to_a).to eql(arr)
        ll.remove_at(i)
        arr.delete_at(i)
        expect(ll.to_a).to eql(arr)
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
  describe '#at' do
    let(:arr) { (0...10).to_a }
    it 'at(i) returns the list value at index i' do
      arr.each { |i| ll.append(i) }
      arr.length.times do |i|
        expect(ll.at(i)).to eql(arr[i])
      end
    end
    it 'return nil if index < -1' do
      arr.each { |i| ll.append(i) }
      expect(ll.at(-1)).to be_nil
    end
    it 'return first value if index = 0' do
      arr.each { |i| ll.append(i) }
      expect(ll.at(0)).to eql(arr[0])
    end
    it 'at(i) on empty list returns nil' do
      expect(ll.at(0)).to be_nil
    end
    it 'raise IndexError if index >= size' do
      arr.each { |i| ll.append(i) }
      expect(ll.at(arr.length)).to be_nil
    end
  end
  describe '#index' do
    let(:arr) do
      (0...10).map { |item| (item + 'a'.ord).chr }
    end
    it 'index() returns nil on empty list' do
      expect(ll.index('test')).to be_nil
    end
    it 'index() returns nil if value no in list' do
      arr.reverse_each { |item| ll.prepend(item) }

      expect(ll.index('test')).to be_nil
    end
    it 'index() returns index of value location' do
      arr.reverse_each { |item| ll.prepend(item) }
      arr.each_with_index do |item, i|
        result = ll.index(item)
        expect(result).to eql(i)
      end
    end
  end
  describe '#contains?' do
    let(:arr) do
      (0...10).map { |item| (item + 'a'.ord).chr }
    end
    it 'contains? returns false on empty list' do
      expect(ll.contains?('test')).to eql(false)
    end
    it 'contains? returns false if value is not in list' do
      arr.reverse_each { |item| ll.prepend(item) }

      expect(ll.contains?('test')).to eql(false)
    end
    it 'contains? true if value is in list' do
      arr.reverse_each { |item| ll.prepend(item) }
      arr.each_with_index do |item, i|
        result = ll.index(item)
        expect(ll.contains?(item)).to eql(true)
      end
    end
  end
end
