require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @count = 0
    @max_load_factor = 0.7
  end

  def []=(key, value)
    i = self.index(key, size)
    if @items[i].nil?
      @items[i] = LinkedList.new
    end
    @items[i].add_to_tail(Node.new(key, value))
    @count += 1
    if load_factor >= @max_load_factor
      self.resize
    end
  end

  def [](key)
    i = self.index(key, size)
    if @items[i]
      current = @items[i].head
      while current != nil
        if current.key == key
          return current.value
        else
          current = current.next
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @count / size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    existing_items = @items.compact
    @items = Array.new(@items.length * 2)
    existing_items.each do |item|
      while @items[i] != nil
        current = @items[index].head
        i = self.index(current.key, @items.length)
        @items[i].add_to_tail(Node.new(current.key, current.value))
        if load_factor >= @max_load_factor
          self.resize
        end
        current = current.next
      end
    end
  end

  def state
    puts "The load factor of the hash is #{load_factor} and the number of items in the hash is #{@count}."
    @items.each do |item|
      if item != nil
        current = @items.head
        while current != nil
          puts "The key is #{current.key}, the value is #{current.value}"
          current = current.next
        end
      end
    end
  end
end
