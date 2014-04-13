require 'prime'
require 'digest/sha1'

def dsa_enc(p,q,alpha,y,m)
	k = rand(0..q)
	r = (alpha^k mod p) mod q
	while(r==0) do
		k = rand(0..q)
		r = (alpha^k mod p) mod q
	end
	
	s = (Digest::SHA1.hexdigest(m) + ar)/k mod q
	puts "signature #{r},#{s} for message #{m}"
end

def gen_dsa_keys()
	q = rand(2^159..2^160)
	while(!Prime.prime?(q)) do
		q = rand(2^159..2^160)
	end
	
	t = rand(0..8)
	
	p = rand(2^(511+64*t)..2^(512+64*t))
	while(((p-1)%q != 0) and (!Prime.prime?(p))) do
		p = rand(2^(511+64*t)..2^(512+64*t))
	end
	
	g = rand(1..p)
	alpha = 1
	while(alpha==1) do
		alpha = g^((p-1)/q) % p
	end
	
	a = rand(1..(q-1))
	y = (a^3) % p
	puts "public key #{p},#{q},#{alpha},#{y}"
	puts "private key #{a}"
	
end

def gen_rsa_keys()
	p =  rand(128..512)
	while(!Prime.prime?(p)) do 
		p =  rand(128..512)
	end
	
	q = rand(128..512)
	while(!Prime.prime?(q)) do 
		q =  rand(128..512)
		while(q == p) do
			q =  rand(128..512)
		end
	end
	
	n = p*q
	fn = (p-1)*(q-1)
	
	e = rand(1..fn)
	while(e.gcd(fn) != 1) do
		e = rand(1..fn)
	end
	
	i = 1
	d = 0
	while(true) do
		break if e*d % fn == 1
		d += 1
	end
	
	puts "public key #{n} #{e}"
	puts "private key #{n} #{d}"
end

def rsa(k1,k2,m)
	p m**k2 % k1
end

if(ARGV[0] == "rsa") then
	gen_rsa_keys() if(ARGV[1] == "gen")
	rsa(ARGV[2].to_i, ARGV[3].to_i, ARGV[4].to_i)if(ARGV[1] == "enc" or ARGV[1] == "dec")
elsif(ARGV[0] == "dsa") then
	gen_dsa_keys() if (ARGV[1] == "gen")
	dsa_enc(ARGV[2].to_i, ARGV[3].to_i, ARGV[4].to_i,ARGV[5].to_i, ARGV[6].to_i ) if (ARGV[1] == "enc")
end
