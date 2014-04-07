arr = [131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251]
p = arr[rand(23)]
q = arr[rand(23)]

n = p*q
fn = (p-1) * (p - 1)

e = rand(fn)

while e.gcd(fn) = 1 do 
	e = rand(fn);
end



i = 1;
while true

	d = (fn * i) / e
	of ((fn * i + 1) % e == 1 )
		break;
	end
	i = i + 1
end

puts "Private key = #{n}#{e} " 

puts "Private key = #{n}#{d} "
