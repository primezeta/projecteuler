def is_divisible_1_20(n)
	n.even? and n % 20 == 0 and n % 19 == 0 and n % 18 == 0 and n % 17 == 0 and n % 16 == 0 and n % 15 == 0 and n % 14 == 0 and n % 13 == 0 and n % 12 == 0 and n % 11 == 0
end

(21..Float::INFINITY).each do |m|
	if is_divisible_1_20(m)
		puts m
		break
	end
end
