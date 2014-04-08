choice = ARGV[0].to_i #1 for encryption, 2 for decryption
n = ARGV[1].to_i
e = ARGV[2].to_i
d = ARGV[3].to_i
m = ARGV[4].to_i


if choice == 1
	c = m**e % n
	puts "crypted m is: #{c}"
else if choice == 2
	dm = m**d % n
	puts "decrypted m is: #{dm}"
else 
	puts "wrong choice"
end

end
