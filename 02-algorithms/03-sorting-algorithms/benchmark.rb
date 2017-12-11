require 'benchmark'
require_relative 'heap_sort'
require_relative 'quick_sort'
require_relative 'bucket_sort'
include Benchmark

numArray = [1, 5, 2, 7, 15, 3, 12, 4, 11, 6, 8, 13, 9, 14, 10]

Benchmark.benchmark(CAPTION, 7, FORMAT, ">avg:") do |x|
	t1 = x.report("Heap Sort: ") {
		heap_sort(numArray)
	}
	t2 = x.report("Quick Sort: ") {
		quick_sort(numArray)
	}
	t3 = x.report("Bucket Sort: ") {
		bucket_sort(numArray)
	}
end
