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
    string = ""
    # @type [Node]
    pointer = @head
    until pointer.nil?
      string.concat("( #{pointer.value} ) -> ") unless pointer.value.nil?
      string.concat("nil") if pointer.next_node.nil?
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

list = LinkedLists.new

list.append(1)
list.append(2)
list.prepend(3)
list.append(5)
list.prepend(4)
puts list
puts "size: #{list.size}"
p list.head