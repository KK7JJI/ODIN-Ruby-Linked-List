# frozen_string_literal: true

module LinkedList
  # linked list datastructure

  # nodes for a linked list
  class Node
    attr_accessor :value, :child, :parent

    def initialize(value: nil,
                   child: nil,
                   parent: nil)
      @value = value
      @parent = parent
      @child = child
    end
  end
end
