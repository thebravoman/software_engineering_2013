filename = ARGV[0]
file_content = File.readlines(filename)
first_time = file_content[1][0..12]
array_time = first_time.split(/[,:]/)
file_content_length = file_content.length
finded = false
br = file_content_length - 1;
while finded==false do
	if file_content[br]=~/-->/ then
		finded = true
	end
	br = br-1
end
br = br+1
last_time = file_content[br][17..28]
array_last = last_time.split(/[,:]/)
first_t = array_time[0].to_i*3600000+array_time[1].to_i*60000+array_time[2].to_i*1000+array_time[3].to_i
last_t = array_last[0].to_i*3600000+array_last[1].to_i*60000+array_last[2].to_i*1000+array_last[3].to_i
#puts first_t
#puts last_t
puts (last_t - first_t)* 1000000
