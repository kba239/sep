require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = head
    @tail = tail
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head.nil? && @tail.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
      @tail.next = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail
      @head = nil
      @tail = nil
    elsif @tail.nil?
      nil
    else
      @head = node
      while node.next !== @tail do
        node = node.next
      end
      @tail = node
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    @head = node
    while node.next !== nil
      break if node.nil?
      puts node.data
      node = node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head === node
      remove_front
    elsif @tail === node
      remove_tail
    else
      @head = node
      while node.next !== node do
        node = node.next
      end
      node.next = node.next.next
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    @head = node.next
    if @head.nil? && @tail.nil?
      @head = node
      @head.next = nil
      @tail = node
      @tail.next = nil
    else
      @head = @head.next
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head.nil? || @head.next.nil? || @head == @tail
      @head = nil
      @tail = nil
    else
      @head = @head.next
    end
  end
end
