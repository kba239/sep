require_relative 'node'
require 'benchmark'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      root.left.nil? ? root.left = node : insert(root.left, node)
    else
      root.right.nil? ? root.right = node : insert(root.right, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.nil? || data.nil? || root.title == data
      root
    else
      if root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    if data.nil?
      nil
    else
      item = find(root, data)
      item.title = nil
      item.rating = nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    result = []
    children = []
    result.push("#{@root.title}: #{@root.rating}")
    @root.left != nil ? children.push(@root.left)
    @root.right != nil ? children.push(@root.right)
    children.each do |child|
      result.push("#{child.title}: #{child.rating}")
      child.left != nil ? children.push(child.left)
      child.right != nil ? children.push(child.right)
    end
    puts result
  end

  casablanca = Node.new("Casablanca", 98)
  psycho = Node.new("Psycho", 96)
  falcon = Node.new("The Maltese Falcon", 100)
  north = Node.new("North by Northwest", 99)
  window = Node.new("Rear Window", 97)
  m = Node.new("M", 95)
  third = Node.new("The Third Man", 94)
  robin = Node.new("The Adventures of Robin Hood", 93)
  philadelphia = Node.new("The Philadelphia Story", 92)
  vertigo = Node.new("Vertigo", 91)
  waterfront = Node.new("On the Waterfront", 90)
  night = Node.new("It Happened One Night", 89)

  binTree = BinarySearchTree.new(falcon)

  binTree.insert(falcon, casablanca)
  binTree.insert(falcon, psycho)
  binTree.insert(falcon, north)
  binTree.insert(falcon, window)
  binTree.insert(falcon, m)
  binTree.insert(falcon, third)
  binTree.insert(falcon, robin)
  binTree.insert(falcon, philadelphia)
  binTree.insert(falcon, vertigo)
  binTree.insert(falcon, waterfront)
  binTree.insert(falcon, night)

  binTree.printf

  i = 0

  numArray = []

  while i <= 10000
    numArray.push(Node.new(i, i))
    i = i + 1
  end

  numTree = BinarySearchTree.new(numArray[0])

  numArray.each do |i|
    numTree.insert(numArray[0], i)
  end

  puts Benchmark.measure {
    numTree.find(numArray[0], 5000)
  }

  numTree.printf

end
