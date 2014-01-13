$hash = Array.new(27) { |i| Array.new(2) { |i| 0 }}
def add_group gsize
	0.upto $hash.size-1 do |row|
		0.upto $hash[row].size-1 do |seats|
			if $hash[row][seats] <= 3-gsize
				$hash[row][seats] += gsize
				p $hash
				return true
			end
		end
	end
	return false
end

r = Random.new
loop do
	rand = r.rand(1..3)
	if add_group(rand)
		puts "successfully added a group of " + rand.to_s + " passengers!"
	else
		puts "Not enough space for a group of " + rand.to_s + " passengers!"
	end
	gets
end

