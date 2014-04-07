include Math
require 'rational'

def primes
    p=[];(2..1024).each{|n| p.any?{|l|n%l==0}?nil:p.push(n)};p
end

def find_d a, m 
	v = 1
	d = a
	u = a == 1
	
	if u
		u = 1
	else
		u = 0
	end
	
	t = 1-u
	if t == 1 
		c = m % a
		u = (m/a).floor
			while c != 1 && t == 1 
				q = (d/c).floor
				d = d % c
				v = v + q*u
				t = (d != 1)
				
				if t
					t = 1
				else
					t = 0
				end
				
				if t == 1
					q = (c/d).floor
					c = c % d
					u = u + q*v
				end
			end
		u = v*(1 - t) + t*(m - u)
	end
	
	u
end

p = primes[rand(100) + 30]
q = primes[rand(100) + 30]
n = p*q
fn = (p - 1) * (q - 1)

e = 2

while(e < fn)
	if (e.gcd fn) == 1
		break
	end
	
	e = e + 1
end

d = find_d e, fn

puts "pub = " + n.to_s + ", " + e.to_s
puts "priv = " + n.to_s + ", " + d.to_s

