puts "Enter the string message"
messsge = gets.chomp.to_s
puts "Enter n"
n = gets.chomp.to_i
chunk = n.to_s.length
puts "Enter e"
e = gets.chomp.to_i
puts "Enter d"
d = gets.chomp.to_i

encryption = String.new
messsge.split("").each do |char|
	encryption += (((char.ord**e) % n).to_s).rjust(chunk, '0')
end

puts "Encryption: #{encryption}"

decryption = String.new
encryption.scan(/.{#{chunk}}/).each do |ch|
	decryption += ((ch.to_i**d) % n).chr
end

puts "Decryption: #{decryption}"
