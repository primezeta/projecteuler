def sum_1_to(n)
	n*(n+1)/2
end

def sum2_1_to(n)
	n*(n+1)*(2*n+1)/6
end

puts sum_1_to(100)**2 - sum2_1_to(100)
