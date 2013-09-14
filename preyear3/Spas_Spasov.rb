count = 0
lookfor = / --> /
filename = ARGV[0]
fn = File.open("#{filename}", "r")
fn.each do |line|

	if line=~ lookfor
		count  +=1
	end
end

puts "The number of subtitles is  : #{count}"
