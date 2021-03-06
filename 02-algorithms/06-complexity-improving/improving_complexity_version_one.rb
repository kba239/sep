require 'benchmark'

# This method takes n arrays as input and combine them in sorted ascending  order
 def version_one(*arrays)
   combined_array = []
   arrays.flatten.each do |val|
     i = 0
     length = combined_array.length
     if length == 0
       combined_array << val
     else
       while i < length
         current = combined_array[i]
         if val <= current
           combined_array.insert(i, val)
           break
         elsif i == length - 1
           combined_array << val
           break
         end
         i+=1
       end
     end
   end

   # Return the sorted array
   combined_array
 end

arrayOne = [2, 5, 1, 13, 15, 19, 18, 16, 3, 6, 4]
arrayTwo = [11, 12, 10, 7, 9, 8, 14, 17, 20]
arrayThree = [21, 23, 22, 27, 29, 28, 24, 26, 25, 30]
arrayFour = [31, 33, 32, 37, 39, 38, 34, 36, 35, 40]

puts version_one(arrayOne, arrayTwo)
puts version_one(arrayOne, arrayTwo, arrayThree, arrayFour)
