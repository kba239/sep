numArray = []
i = 1
while i <= 50
  numArray.push(i)
  i += 1
end

mid = numArray.length / 2
low = numArray.first
high = numArray.last
count = 1

def binary_search_recursive(array, item)
  if array.include?(item) == false
    puts "That item is not included in the array."
  else
    if array[mid] == item
      "After #{count} iterations, the item #{item} was found at index #{mid}."
    elsif array[mid] > item
        high = mid
        mid = (high + low) / 2
        count += 1
        binary_search_recursive(array, element)
    elsif array[mid] < item
        low = mid
        mid = (high + low) / 2
        count += 1
        binary_search_recursive(array, element)
    end
  end
end

puts binary_search_recursive(numArray, 22)
