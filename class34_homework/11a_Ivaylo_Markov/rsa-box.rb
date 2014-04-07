if(ARGV.size < 3) then
	puts "Usage: ruby rsa-box.rb key1 key2 num "
	exit
end

k1 = ARGV[0].to_i
k2 = ARGV[1].to_i
m = ARGV[2].to_i

p m**k2 % k1
