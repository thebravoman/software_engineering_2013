filename = ARGV[0]
file_content = File.readlines(filename)
text = ""
only_time_lines = []
arr = []
file_content_length = file_content.length
0.upto(file_content_length) do |i|
	if file_content[i] =~ /-->/ then
		only_time_lines<<file_content[i]
	end
end
1.upto(only_time_lines.length) do |i|
	k = i-1
	first = only_time_lines[i].to_s[0..12]
	last = only_time_lines[k].to_s[17..28]
	array_last = last.to_s.split(/[,:]/)
	array_first = first.to_s.split(/[,:]/)
	first_t = array_first[0].to_i*3600000+array_first[1].to_i*60000+array_first[2].to_i*1000+array_first[3].to_i
	last_t = array_last[0].to_i*3600000+array_last[1].to_i*60000+array_last[2].to_i*1000+array_last[3].to_i
	raz = first_t-last_t

	if raz.to_f/1000 <= 3 then
		arr<<" "
	end
	if raz.to_f/1000 > 3 then
		arr<<"\n"
	end
end
k = 0
0.upto(file_content_length) do |i|
 	if file_content[i]=~/[a-z]/ or file_content[i]=~/[A-Z]/ then
		text = text.to_s + file_content[i].to_s[0..(file_content[i].length-2)].to_s+arr[k].to_s
		k = k.to_i+1
	end
end
File.open("resutl_srt.txt","w") do |f|
	f.puts text
end
