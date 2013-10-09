require 'date'

Dir.glob("*_1.rb") do |file|
	result = `git log #{file}`
	full_date = result.lines.to_a[2]
	date_string = full_date.split("Date: ")[1..-1][0].strip
	puts "#{file}, #{date_string}"
end

#~ lines = File.readlines("1.log")
#~ date_string= lines[2].
#~ date = DateTime.parse(date_string)
#~ puts date.to_time
#~ puts date.to_time + 7200
