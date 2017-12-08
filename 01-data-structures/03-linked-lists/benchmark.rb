require 'benchmark'
include Benchmark
require_relative 'node'
require_relative 'linked_list'

array = []
list = LinkedList.new

Benchmark.bm do |x|
  #Compare the time it takes to create a 10,000 item Array to appending 10,000 items to a Linked List.
  x.report("Push 10,000 items to array") {
    n = 0;
    while n < 10000;
      array.push(n.to_s);
      n += 1;
    end
  }
  x.report("Append 10,000 items to list") {
    n = 0;
    while n < 10000;
      list.add_to_tail( Node.new(n.to_s) );
      n += 1;
    end
  }

  #Compare the time it takes to access the 5000th element of the Array and the 5000th Node in the Linked List.
  x.report("Find the 5,000th item in array") {
    array[4999]
  }
  x.report("Find the 5,000th item in list") {
    list.find_node(4999.to_s)
  }

  #Compare the time it takes to remove the 5000th element from the Array to removing the 5000th Node in the Linked List.
  x.report("Delete the 5,000th item in array") {
    array.delete_at(4999)
  }
  x.report("Delete 5,000th item in list") {
    list.delete( list.find_node(4999.to_s)
  }
end
