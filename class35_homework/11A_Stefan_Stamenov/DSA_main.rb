require_relative 'DSA.rb'

puts "Type the message:"
msg = gets.chomp.to_i
dsa = DSA.new
keys = dsa.generate_keys
