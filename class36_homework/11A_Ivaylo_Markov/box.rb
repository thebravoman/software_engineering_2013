# For encrypting: ruby box.rb enc n e <message>
# For decrypting: ruby box.rb dec n d <chunks>
# chunks is the amount of encrypted blocks
exit if(ARGV.size < 4)

action = ARGV[0]
n = ARGV[1].to_i #n
k2 = ARGV[2].to_i #e or d -  doesn't matter

if(action == "enc") then
	msg = ARGV[3]
	ciphert = []
	msg.each_byte do |ch|
		puts "#{((ch**k2)%n)}"
	end
elsif (action == "dec") then
	puts "Enter the encrypted blocks one by one:"
	num_blocks = ARGV[3].to_i
	blocks = []
	i = 0
	while(i<num_blocks) do
		blocks << STDIN.gets.chomp
		i+=1
	end
	blocks.each do |block|
		block = block.to_i
		print "#{((block**k2)%n).chr}"
	end
else puts "Invalid action. Halting..."
end







