require_relative 'node'
require 'benchmark'

class MinBinaryHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      @root = node
      node = root
      insert(@root, node)
    else
     if root.left.nil?
       root.left = node
     elsif root.right.nil? && root.left != nil
       root.right = node
     elsif root.left != nil && root.right != nil && root.left.left != nil && root.left.right != nil
       insert(root.right, node)
     elsif root.left != nil && root.right != nil
       insert(root.left, node)
     end
   end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.nil? || data.nil?
      nil
    else
      if root.title == data
        root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    if root.nil? || data.nil?
      nil
    else
      item = find(root, name)
      if item.nil?
        nil
      else
        item.title = nil
        item.rating = nil
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    result = []
    children = [@root]
    children.each do |item|
      result.push("#{item.title}: #{item.rating}")
      if item.left != nil
        children.push(item.left)
      end
      if item.right != nil
        children.push(item.right)
      end
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

  binHeap = MinBinaryHeap.new(falcon)

  binHeap.insert(falcon, casablanca)
  binHeap.insert(falcon, psycho)
  binHeap.insert(falcon, north)
  binHeap.insert(falcon, window)
  binHeap.insert(falcon, m)
  binHeap.insert(falcon, third)
  binHeap.insert(falcon, robin)
  binHeap.insert(falcon, philadelphia)
  binHeap.insert(falcon, vertigo)
  binHeap.insert(falcon, waterfront)
  binHeap.insert(falcon, night)

  binHeap.printf

  numArray = []

  i = 0

  while i <= 10000
    numArray.push(Node.new(i, i))
    i = i + 1
  end

  numHeap = MinBinaryHeap.new(numArray[0])

  numArray.each do |i|
    numHeap.insert(numHeap.root, i)
  end

  puts Benchmark.measure { numHeap.find(numHeap.root, 5000) }

  numHeap.printf

end
