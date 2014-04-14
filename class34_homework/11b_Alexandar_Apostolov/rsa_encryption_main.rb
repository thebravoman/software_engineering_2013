require './rsa_encryption_functionality.rb'

puts "Enter a message to encrypt:"
msg = gets.chomp.to_i
keys = generate_keys
enc_msg = encryption(keys, msg)
decryption(keys, enc_msg)

