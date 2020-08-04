class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_reader :size
  attr_accessor :node

  def initialize
    @node = nil
    @size = 0
  end

  def append(value)
    if @node.nil?
      @node = Node.new(value)
    elsif !@node.nil?
      node = @node
      node = node.next_node until node.next_node.nil? || node.nil?
      node.next_node = Node.new(value)
    end
    @size += 1
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = self.node
    @node = node
    @size += 1
  end

  def head
    @node.value
  end

  def tail
    begin
      node = @node.next_node
    end until node.next_node.nil?
    node.value
  end

  def at(index)
    index += @size if index < 0
    return nil if @size == 0 || index > @size - 1
    return @node.value if index == 0

    i = 0
    node = @node
    begin
      node = node.next_node
      i += 1
    end until i == index
    node.value
  end

  def pop
    return nil if @size == 0

    if @size == 1
      last_node = @node
      self.node = nil
      @size = 0
      return last_node.value
    end

    i = 0
    node = @node
    until i == @size - 2
      node = node.next_node
      i += 1
    end

    last_node = node.next_node
    node.next_node = nil
    @size -= 1
    last_node.value
  end

  def contains?(value)
    return false if @size == 0

    node = @node

    loop do
      if node.value === value
        return true
      else
        return false if node.next_node.nil?

        node = node.next_node
      end
    end
  end

  def find(value)
    return nil if @size == 0

    node = @node
    i = 0

    loop do
      if node.value === value
        return i
      else
        return nil if node.next_node.nil?
        node = node.next_node
      end
      i += 1
    end
  end

  def to_s
    return 'nil' if @size == 0
    node = @node
    str = ''

    loop do
      str += "( #{node.value} ) => "
      break if node.next_node.nil?
      node = node.next_node
    end

    puts str + ' nil'
  end
end
