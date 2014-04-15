require "digest/sha1"

print "Enter m: "
m = gets.chomp().to_i

print "Enter g: "
g = gets.chomp().to_i

print "Enter p: "
p = gets.chomp().to_i

print "Enter q: "
q = gets.chomp().to_i

print "Enter x: "
x=gets.chomp().to_i

begin
    k = rand(q-1)+1
    r = (g**k%p) % q
    s = ( ((Digest::SHA1.digest(m.to_s)).to_i+x*r) / k ) % q
end while (s == 0 || r == 0)

print "signature (#{r} , #{s}) \n"

