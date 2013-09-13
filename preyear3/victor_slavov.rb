a = ARGV[0];
file = File.open("#{a}", "r");

file_info = file.readlines;
length = file_info.length;
count = 0;
element = file_info[length - 1];

while length > 0 do
	if element[2] == ":" then
		if element[14] == "-" then
			count = file_info[length - 2];
			break;
		else
			length = length - 1;
			element = file_info[length - 1];
		end
	else
		length = length - 1;
		element = file_info[length - 1];
	end
end

puts count;
