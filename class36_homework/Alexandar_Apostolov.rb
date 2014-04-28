# Arguments:
# ruby Alexandar_Apostolov.rb message n e d
# Example: n = 45173, e = 30959, d = 39851

msg = ARGV[0].to_s
n = ARGV[1].to_i
chunk = n.to_s.length

puts "Encryption: "

e = ARGV[2].to_i
enc_msg = String.new

msg.split("").each do |char|

	#puts char.ord
	enc_msg += (((char.ord**e) % n).to_s).rjust(chunk, '0')

end

puts enc_msg
puts

puts "Decryption: "

d = ARGV[3].to_i
dec_msg = String.new

enc_msg.scan(/.{#{chunk}}/).each do |chunkie|

	dec_msg += ((chunkie.to_i**d) % n).chr

end

puts dec_msg
