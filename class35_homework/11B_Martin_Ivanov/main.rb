require_relative 'lib.rb'

puts "Enter a message to encrypt:"
msg = gets.chomp.to_i
dsa = DSA.new
keys = dsa.generate_keys
