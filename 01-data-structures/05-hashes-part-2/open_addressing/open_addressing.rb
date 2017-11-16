require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @count = 0
  end

  def []=(key, value)
    i = self.index(key, size)
    if @items[i].nil?
      @items[i] = Node.new(key, value)
      @count += 1
    elsif @items[i].key != key || @items[i].value != value
      nextI = self.next_open_index(i)
      if @items[i].key == key && @items[i].value != value && nextI == -1
        self.resize
        @items[nextI].value = value
        @count += 1
      elsif nextI == -1
        self.resize
        self[key] = value
      else
        @items[nextI] = Node.new(key, value)
        @items[nextI].value = value
        @count += 1
      end
    end
  end

  def [](key)
    i = self.index(key, size)
    while i < size
      if @items[i].key == key
        @items[i].value
      else
        i += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index] != nil
      index += 1
    end
    if index >= self.size
      -1
    else
      index
    end
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
      self[item.key] = item.value
    end
  end

  def state
    i = self.index(key, size)
    if @items[i] != nil
      puts "There are #{@count} items in the hash."
      @items.each do |item|
        puts "The key is #{i.key}, the value is #{i.value}, and the point is #{i}."
      end
    else
      puts "There are no items in the hash."
    end
  end
end
