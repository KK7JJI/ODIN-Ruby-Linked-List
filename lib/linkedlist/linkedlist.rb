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
      values = values.flatten
      self.size += values.length
      return nil if values.length.zero?

      # empty list: create head, create tail

      # one element list (tail = nil)

      # insert before the specified node

      values
    end

    def at(index)
      # public
    end

    def pop
      # public
      return nil if empty?

      self.size -= 1
      result = head.value
      self.head = head.child
      result
    end

    def remove_at(index)
      # public
      return nil unless index < size
      return nil if size.zero?

      self.size -= 1
      return remove_at_head if index.zero?
      return remove_at_tail if index == -1

      node = locate_node(index)

      parent_node = node.parent
      child_node = node.child
      parent_node.child = nil
      child_node.parent = nil
      parent_node.child = child_node unless parent_node.nil?
      child_node.parent = parent_node unless child_node.nil?

      node.value
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

    def remove_at_head
      # index = 0
      node = head

      if tail.nil?
        self.head = nil
      elsif head.child == tail
        self.head = tail
        head.child = nil
        self.tail = nil
      else
        self.head = head.child
      end

      node.value
    end

    def remove_at_tail
      if tail.nil?
        node = head
        self.head = nil
      else
        node = tail
        self.tail = tail.child
      end

      node.value
    end

    def first_head(node)
      self.head = node
    end

    def append_first_tail(node)
      node.parent = head
      head.child = node
      self.tail = node

      node
    end

    def locate_node(index)
      location = 0
      node = head
      while location < self.size && location < index
        node = node.child
        location += 1
      end
      return nil if location < index

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
