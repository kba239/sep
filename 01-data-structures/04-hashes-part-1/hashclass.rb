require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    if @items[index(key, @items.length)] != key
      self.resize
      self[key] = value
    elsif items[index(key, @items.length)].nil?
      @items[index(key, @items.length)] = HashItem.new(key, value)
    elsif @items[index(key, @items.length)] == key && @items[index(key, @items.length)].value != value
      self.resize
      @items[index(key, @items.length)].value = value
    end
  end


  def [](key)
    if @items[index(key, @items.length)] != nil && @items[index(key, @items.length)]
      @items[index(key, @items.length)].value
    end
  end

  def resize
    existing_items = @items.compact
    @items = Array.new(@items.length * 2)
    existing_items.each do |item|
      self[item.key] = item.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
