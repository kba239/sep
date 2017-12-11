require 'benchmark'

def bucket_sort(array)
  s = array.length-1
  max = 100
  buckets = Array.new(max)
  for j in 0...max do
    buckets[j] = 0
  end
  for i in 0...s do
    buckets[array[i]] += 1
  end
  i = 0
  for j in 0...max do
    for k in 0...buckets[j]
      array[i] = j
      i += 1
    end
  end
  array
end

numArray = [1, 5, 2, 7, 15, 3, 12, 4, 11, 6, 8, 13, 9, 14, 10]

puts bucket_sort(numArray)
