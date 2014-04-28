if(ARGV.size < 4)
	puts "Wrong number of arguments!!!"
end

option = ARGV[0]
n = ARGV[1].to_i
k2 = ARGV[2].to_i 

if(option == "enc") then
	msg = ARGV[3]
	ciphert = []
	msg.each_byte do |ch|
		puts "#{((ch**k2)%n)}"
	end
elsif (option == "dec") then
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
else puts "Bad option!"
end