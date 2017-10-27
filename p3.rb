require 'set'

n = 600851475143
pfactors = Set.new

(3..n/2).step(2).each do |m|
	if n % m == 0
		nump = 0
		(3..m/2).step(2).each do |p|
			if m % p == 0
				nump += 1
			end
		end	
		if nump < 1
			pfactors.add(m)
		end
	end
end

puts pfactors.max			
