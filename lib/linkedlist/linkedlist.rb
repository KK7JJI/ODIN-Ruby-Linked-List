# frozen_string_literal: true

module LinkedList
  # linked list datastructure
  class LinkedList
    attr_accessor :size

    def initialize
      @size = 0
    end

    def append(value)
      # public
      self.size += 1
    end

    def prepend(value)
      # public
      self.size += 1
    end

    def insert_at(index, *values)
      # public
      puts values.flatten.inspect
      self.size += values.flatten.length
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

    def head
    end

    def tail
    end
  end
end
