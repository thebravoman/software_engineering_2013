

encMessage=""
decMessage=""

publicKey = ARGV[0].split(",")
privateKey = ARGV[1].split(",")
option=ARGV[3]
message= ARGV[2]


if(option == "encrypt")
encMessage<< ((message.to_i**publicKey [0].to_i)%publicKey [1].to_i).to_s
#p message.to_i**publicKey [0].to_i
puts "Old message '#{message}' -> Encrypted message = '#{encMessage}' -> publicKey  = '#{publicKey [0]},#{publicKey [1]}'"
elsif(option == "decrypt")
decMessage << ((message.to_i**privateKey[0].to_i)%privateKey[1].to_i).to_s
puts "Old message ='#{message}' -> Decrypted message = '#{decMessage}' -> privateKey = '#{privateKey[0]},#{privateKey[1]}'"

end