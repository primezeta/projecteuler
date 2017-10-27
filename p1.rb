x = 0
range = (0..999)
range.step(3) {|i| x += i}
range.step(5) {|i| x += i}
range.step(15) {|i| x -= i}
puts x
