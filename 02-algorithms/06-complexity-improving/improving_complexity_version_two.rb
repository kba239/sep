require 'benchmark'

# This method takes n arrays as input and combine them in sorted ascending  order
def version_two(*arrays)
  combined_array = arrays.flatten
  s = combined_array.size
  a = [nil] + combined_array
  (s / 2).downto(1) do |i|
    heapify(a, i, s)
  end

  while s > 1
    a[1], a[s] = a[s], a[1]
    s -= 1
    heapify(a, 1, s)
  end
  a.drop(1)
end


def heapify(array, parent, limit)
  root = array[parent]
  while (child = 2 * parent) <= limit
    if child < limit && array[child] < array[child + 1]
      child += 1
    end
    break if root >= array[child]
    array[parent] = array[child]
    parent = child
  end
  array[parent] = root
end


arrayOne = [2, 5, 1, 13, 15, 19, 18, 16, 3, 6, 4]
arrayTwo = [11, 12, 10, 7, 9, 8, 14, 17, 20]
arrayThree = [21, 23, 22, 27, 29, 28, 24, 26, 25, 30]
arrayFour = [31, 33, 32, 37, 39, 38, 34, 36, 35, 40]

puts version_two(arrayOne, arrayTwo)
puts version_two(arrayOne, arrayTwo, arrayThree, arrayFour)
