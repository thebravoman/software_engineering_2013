require './dsa_encryption_functionality.rb'

# H = SHA1 ; dgst.name
# L = 64 ; 64bit -> long 
# N = 16 ; N <= H.digest_length ; 16bit -> short

puts "Enter a message to encrypt:"
msg = gets.chomp.to_i
keys = generate_keys
#enc_msg = encryption(keys, msg)
#decryption(keys, enc_msg)

