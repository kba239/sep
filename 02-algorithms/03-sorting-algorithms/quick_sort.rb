require 'benchmark'

def quick_sort(array)
  pivot = array.last
  above = []
  below = []
  if array.length <= 1
    array
  else
    array.delete_at(array.index(pivot))
    array.each do |i|
      if i > pivot
        above << i
      else
        below << i
      end
    end
    sorted_array = []
    sorted_array << quick_sort(below)
    sorted_array << pivot
    sorted_array << quick_sort(above)
    sorted_array.flatten!
  end
end

numArray = [1, 5, 2, 7, 15, 3, 12, 4, 11, 6, 8, 13, 9, 14, 10]

puts quick_sort(numArray)
