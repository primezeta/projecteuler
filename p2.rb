def fibsum(x1, x2)
	x = x1 + x2
	if x < 4000000
		if x.even?
			x + fibsum(x2, x)
		else
			fibsum(x2, x)
		end
	else
		0
	end
end

puts fibsum(0, 1)
