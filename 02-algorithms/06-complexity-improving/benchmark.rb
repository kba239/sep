require 'benchmark'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'
require_relative 'improving_complexity_version_three'
require_relative 'original'
include Benchmark

arrayOne = [2, 5, 1, 13, 15, 19, 18, 16, 3, 6, 4]
arrayTwo = [11, 12, 10, 7, 9, 8, 14, 17, 20]
arrayThree = [21, 23, 22, 27, 29, 28, 24, 26, 25, 30]
arrayFour = [31, 33, 32, 37, 39, 38, 34, 36, 35, 40]

Benchmark.benchmark(CAPTION, 7, FORMAT, ">avg:") do |x|
	t1 = x.report("Version One: ") {
		#version_one(arrayOne, arrayTwo)
		version_one(arrayOne, arrayTwo, arrayThree, arrayFour)
	}
	t2 = x.report("Version Two: ") {
		#version_two(arrayOne, arrayTwo)
		version_two(arrayOne, arrayTwo, arrayThree, arrayFour)
	}
	t3 = x.report("Version Three: ") {
		#version_three(arrayOne, arrayTwo)
		version_three(arrayOne, arrayTwo, arrayThree, arrayFour)
	}
	t4 = x.report("Original: ") {
		#original(arrayOne, arrayTwo)
		original(arrayOne, arrayTwo, arrayThree, arrayFour)
	}
end
