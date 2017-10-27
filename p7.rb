require 'benchmark'

def logical_and(a, b)
	a && b
end

def is_divisible(n, m)
	m > 1 and n % m == 0
end

def is_prime(n)
	n == 2 or n == 3 or
	Array((2..n/2)).map { |m|
		not is_divisible(n, m)
	}.reduce{ |a, b|
		logical_and(a, b)
	} == true
end

Benchmark.bm(10) do |b|
	b.report("Problem 7") {
		nth = 0
		(2..Float::INFINITY).each do |n|
			if is_prime(n)
				nth += 1
				if nth == 2000
					puts n
					break
				end
			end
		end
	}
end

