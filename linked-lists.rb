class LinkedLists
  def initialize
    @head = Node.new
  end

  def append(value)
    node = Node.new(value)
    # @type [Node]
    pointer = @head
    pointer = pointer.next_node until pointer.next_node.nil?
    pointer.next_node = node
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head.next_node
    @head.next_node = node
  end

  def head
    @head.next_node
  end

  def tail
    pointer = @head
    pointer = pointer.next_node until pointer.next_node.nil?
    pointer
  end

  def at(index)
    pointer = @head
    count = 0
    until count == index
      return nil if pointer.next_node.nil?

      pointer = pointer.next_node
      count += 1
    end
    pointer
  end

  def pop
    # @type [Node]
    pointer = @head
    pointer = pointer.next_node until pointer.next_node.next_node.nil?
    pointer.next_node = nil
  end

  def contains?(value)
    pointer = @head
    until pointer.next_node.nil?
      pointer = pointer.next_node
      return true if pointer.value == value

    end
    false
  end

  def find(value)
    pointer = @head
    index = 0
    until pointer.next_node.nil?
      pointer = pointer.next_node
      index += 1
      return index if pointer.value == value

    end
    nil
  end

  def insert_at(value, index)
    node = Node.new(value)
    pointer = @head
    count = 0
    until count == index
      if count == index - 1
        after = pointer.next_node
        pointer.next_node = node
        node.next_node = after
      end
      pointer = pointer.next_node
      count += 1
    end
  end

  def remove_at(index)
    pointer = @head
    count = 0
    until count == index
      pointer.next_node = pointer.next_node.next_node if count == index - 1
      pointer = pointer.next_node
      count += 1
    end
  end

  def size
    # @type [Node]
    pointer = @head
    count = 0
    until pointer.next_node.nil?
      pointer = pointer.next_node
      count += 1
    end
    count
  end

  def to_s
    # @type [String]
    string = ''
    # @type [Node]
    pointer = @head
    until pointer.nil?
      string.concat("( #{pointer.value} ) -> ") unless pointer.value.nil?
      string.concat('nil') if pointer.next_node.nil?
      pointer = pointer.next_node
    end
    string
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end
