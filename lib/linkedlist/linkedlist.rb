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

    def insert_at(index, value)
      raise IndexError if !empty? && !(index >= -1 && index < size)

      self.size += 1
      return insert_at_head(value) if index.zero?
      return insert_after_tail(value) if index == -1

      node = locate_node(index)

      new_node = Node.new(value: value)
      prior_node = node.parent
      next_node = node

      prior_node.child = new_node
      new_node.parent = prior_node
      next_node.parent = new_node
      new_node.child = next_node

      node.value
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
      return remove_at_tail if node == tail

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

    def insert_at_head(value)
      new_node = Node.new(value: value)
      if head.nil?
        self.head = new_node
        head.parent = nil
        head.child = nil
      elsif tail.nil?
        self.tail = head
        self.head = new_node
        head.parent = nil
        head.child = tail
        tail.parent = head
        tail.child = nil
      else
        head.parent = new_node
        new_node.child = head
        self.head = new_node
      end

      value
    end

    def insert_after_tail(value)
      return insert_at_head(value) if head.nil?

      new_node = Node.new(value: value)
      if tail.nil?
        self.tail = new_node
        head.child = tail
        tail.parent = head
      else
        tail.child = new_node
        new_node.parent = tail
        self.tail = new_node
      end

      value
    end

    def remove_at_head
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
      elsif head.child == tail
        node = tail
        head.child = nil
        self.tail = nil
      else
        node = tail
        self.tail = tail.parent
        tail.child = nil
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
      while location < index && location <= self.size
        location += 1
        node = node.child
      end

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
