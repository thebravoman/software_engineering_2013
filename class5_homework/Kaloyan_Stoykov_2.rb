require 'time'

f_sub_time = 0
l_sub_time = 0
sub_time = 0
i=0

File.open(ARGV[0]).each do |line|
	if (line =~ /-->/) && i == 0
		f_sub_time = Time.parse(line.split("-->")[0])
		i = i + 1
	end
	if line =~ /-->/
		l_sub_time = Time.parse(line.split("-->")[1])
	end
end

sub_time = ((l_sub_time - f_sub_time) * 1000000000).to_i
puts sub_time