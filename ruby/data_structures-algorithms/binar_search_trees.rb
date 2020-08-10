class Node
  include Comparable
  attr_accessor :right, :left, :data
  def initialize(data, _right = nil, _left = nil)
    @data = data
    @right = nil
    @left = nil
  end
end

class Tree
  attr_accessor :root
  def initialize(arr)
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    return if arr.empty?

    mid = arr.size / 2
    root = Node.new(arr[mid])

    root.left = build_tree(arr[0...mid])
    root.right = build_tree(arr[mid + 1..-1])

    root
  end

  def insert(data)
    return @root = Node.new(data) if @root.nil?

    node = @root

    loop do
      if data < node.data
        if node.left.nil?
          node.left = Node.new(data)
          return self
        end

        node = node.left
      elsif data > node.data
        if node.right.nil?
          node.right = Node.new(data)
          return self
        end

        node = node.right
      else
        break
      end
    end
  end

  def delete(data)
    node = find(data)
    return nil if node.nil?

    node_parent = node_parent(data)

    # node leaf
    if node.left.nil? && node.right.nil?
      # node leaf == root
      return @root.data = nil if node_parent.nil?

      node_parent.left == node ? node_parent.left = nil : node_parent.right = nil
      return
    end

    # node has one child
    # node has right child
    if node.left.nil? && !node.right.nil?
      node_parent.left = (node_parent.left.data == data ? node.right : node.right)
      return
    end
    # node has left child
    if node.right.nil? && !node.left.nil?
      node_parent.left = (node_parent.left.data == data ? node.left : node.left)
      return
    end

    # node has two children
    node_min = node_min_in_r(node)
    delete(node_min.data)
    node.data = node_min.data
    nil
  end

  def find(data)
    node = @root
    loop do
      return node if node.data == data
      return nil if node.left.nil? && node.right.nil?

      node = data < node.data ? node.left : node.right
    end
  end

  def level_order
    resuilt = []
    queue = [@root]
    loop do
      node = queue[0]
      resuilt << node.data
      queue << node.left if node.left
      queue << node.right if node.right
      queue.shift
      break if queue.empty?
    end

    resuilt
  end

  def inorder(node = @root)
    resuilt = []

    resuilt << inorder(node.left) if node.left
    resuilt << node.data
    resuilt << inorder(node.right) if node.right

    resuilt.flatten
  end

  def preorder(node = @root)
    resuilt = []
    resuilt << node.data
    resuilt << preorder(node.left) if node.left
    resuilt << preorder(node.right) if node.right

    resuilt.flatten
  end

  def postorder(node = @root)
    resuilt = []
    resuilt << preorder(node.left) if node.left
    resuilt << preorder(node.right) if node.right
    resuilt << node.data

    resuilt.flatten
  end

  def height(node = @root)
    return -1 if node.nil?
    h_left = height(node.left)
    h_right = height(node.right)
    h_left > h_right ? h_left += 1 : h_right += 1
  end

  def depth(node)
    height(node)
  end

  def balanced?
    ( height(@root.left) - height(@root.right) ).abs <= 1
  end

  def rebalance
    arr = self.level_order.sort
    @root = build_tree(arr)
    self
  end

  def node_parent(data)
    return nil if @root.data == data

    node = @root
    loop do
      if data < node.data
        return node if node.left.data == data

        node = node.left
      else
        return node if node.right.data == data

        node = node.right
      end
      return nil if node.left.nil? && node.right.nil?
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    if node.nil?
      puts 'nil'
      return
    end

    pretty_print(node.right, "#{prefix}#{is_left ? '│ ' : ' '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? ' ' : '│ '}", true) if node.left
  end

  def node_min_in_r(node)
    node = node.right
    until node.left == node.right
      if node.left.nil?
        node = node.right
        next
      end
      node = node.left
    end
    node
  end

  private :node_min_in_r
end

# DRIVER SCRIPT
# 1. Random array
arr = Array.new(15) { rand(1..100) }
tree = Tree.new(arr)
# 2. Confirm that the tree is balanced
puts "Tree balance?\n- #{tree.balanced?}"
# 3. Print out all elements in level, pre, post, and in order
puts 'All elements'
puts "Level order: #{tree.level_order}\nIn order: #{tree.inorder}\nPreorder: #{tree.preorder}\nPostorder: #{tree.postorder}"
# 4. Unbalance the tree by adding several numbers > 100
puts 'Insert 200'
tree.insert(200)

# 5. Confirm that the tree is unbalanced by calling `#balanced?`
puts "Tree balance?\n- #{tree.balanced?}"
# 6. Balance the tree by calling `#rebalance`
puts 'Rebalance'
tree.rebalance
# 7. Confirm that the tree is balanced by calling `#balanced?`
puts 'After rebalance'
puts "Tree balance?\n- #{tree.balanced?}"
# 8. Print out all elements in level, pre, post, and in order
puts 'All elements'
puts "Level order: #{tree.level_order}\nIn order: #{tree.inorder}\nPreorder: #{tree.preorder}\nPostorder: #{tree.postorder}"
