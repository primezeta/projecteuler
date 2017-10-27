def reverse_digits(n)
	n.to_s.reverse!.to_i
end

def is_palindromic(n)
	n == reverse_digits(n)	
end

def step_196(n)
	n + reverse_digits(n)
end

candidates = []
min = 100*100
max = 999*999

(min..max).each do |n|
#Use the 196-algorithm to produce palindromic numbers
	print "#{n} => "
	previous_m = 0
	m = step_196(n)
	while not is_palindromic(m) and m <= max and m != previous_m do
		previous_m = m
		m = step_196(n)
	end	
	
	if m <= max and is_palindromic(m)
		print "#{m}\n"
		(100...999).each do |d|
			q = m/d
			r = m%d
			if r == 0 and q >= 100 and q <=999
				candidates.push(m)
			end
		end
	else
		print "nothing\n"
	end
end

puts candidates.max
