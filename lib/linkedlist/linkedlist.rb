# frozen_string_literal: true

module LinkedList
  # linked list datastructure
  class LinkedList
    attr_accessor :size

    def initialize
      @size = 0
      @head = nil
      @tail = nil
    end

    def append(value)
      # public
      self.size += 1
      node = Node.new(value: value, child: nil, parent: nil)

      if head.nil?
        first_head(node)
      elsif tail.nil?
        append_first_tail(node)
      else
        tail.child = node
        node.parent = tail
        self.tail = node
      end

      node.value
    end

    def prepend(value)
      # public
      self.size += 1
      node = Node.new(value: value, child: nil, parent: nil)

      if head.nil?
        first_head(node)
      elsif tail.nil?
        prepend_first_tail(node)
      else
        node.child = head
        head.parent = node
        self.head = node
      end

      node.value
    end

    def insert_at(index, *values)
      # public
      self.size += values.flatten.length

      values.flatten
    end

    def at(index)
      # public
    end

    def pop
      # public
      self.size -= 1
    end

    def remove_at(index)
      # public
      self.size -= 1
    end

    def index(value)
      # public
    end

    def to_s
      # public
    end

    def to_a
      # public
      result = []
      return result if head.nil?

      node = head
      until node.child.nil?
        result << node.value
        node = node.child
      end
      result << node.value unless node.nil?

      result
    end

    def contains?(value)
      # public
    end

    def empty?
      # public
      return true if size.zero?

      false
    end

    private

    attr_accessor :head, :tail

    def first_head(node)
      self.head = node
    end

    def append_first_tail(node)
      node.parent = head
      head.child = node
      self.tail = node

      node
    end

    def prepend_first_tail(node)
      self.tail = head
      self.head = node
      head.child = tail
      tail.parent = head

      node
    end
  end
end
