require 'benchmark'

def heap_sort(array)
  s = array.size
  a = [nil] + array
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

numArray = [1, 5, 2, 7, 15, 3, 12, 4, 11, 6, 8, 13, 9, 14, 10]

puts heap_sort(numArray)
