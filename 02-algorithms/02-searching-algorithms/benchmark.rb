require 'benchmark'
require_relative 'fibonacci_recursive'
require_relative 'fibonacci_iterative'


Benchmark.bm do |x|
	t1 = x.report("fibonacci_recursive(20): ") {
		fib(20)
	}
	t2 = x.report("fibonacci_iterative(20): ") {
		fib(20)
	}
end
