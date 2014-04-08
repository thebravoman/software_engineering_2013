#ruby -v => 2.0.0
require_relative 'lib'

def encrypt num, pub_key, modulus
  return (num**pub_key)%modulus
end

def decrypt num, priv_key, modulus
  return (num**priv_key)%modulus
end

puts "Enter int num:"
num = gets.chomp
puts "You entered: ", num.to_i
generator = RSA.new
d, n, e = generator.generate_keys

a = encrypt num.to_i, e, n
b = decrypt a, d, n

puts "encrypt: ", a
puts "decrypt: ", b
