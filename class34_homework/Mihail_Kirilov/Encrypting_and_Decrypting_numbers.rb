public_key = ARGV[0].split(",")
public_key
private_key = ARGV[1].split(",")

message = ARGV[2]
encrypted_message = ""
decrypted_message = ""
t = ARGV[3]
if(t == "encrypt")  
	encrypted_message << ((message.to_i**public_key[0].to_i)%public_key[1].to_i).to_s
	p message.to_i**public_key[0].to_i
	puts "The message '#{message}' was Encrypted into '#{encrypted_message}' by the public_key = '#{public_key[0]},#{public_key[1]}'"
elsif(t == "decrypt") 
	decrypted_message << ((message.to_i**private_key[0].to_i)%private_key[1].to_i).to_s
	puts "The message '#{message}' was Decrypted into '#{decrypted_message}' by the private_key = '#{private_key[0]},#{private_key[1]}'"

else 
	puts "Not a valid command"
	puts "The first argument must be the public key. The second must be the private key. 'e,n'"
	puts "The third must be the message and the fourth my be encrypt or decrypt."

end
