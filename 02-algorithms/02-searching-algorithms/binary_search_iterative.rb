numArray = []
i = 1
while i <= 50
  numArray.push(i)
  i += 1
end

def binary_search_iterative(array, item)
  mid = array.length / 2
  low = array.first
  high = array.last
  count = 1
  if array.include?(item) == false
    puts "That item is not included in the array."
  else
    while array[mid] != item
      if array[mid] > item
        high = item
        item = (high + low) / 2
      elsif array[mid] < item
        low = mid
        mid = (high + low) / 2
      end
      count += 1
    end
  end
  puts "After #{count} iterations, the item #{item} was found at index #{mid}."
end

puts binary_search_iterative(numArray, 22)
