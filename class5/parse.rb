require 'date'
require 'time'

Dir.glob("*_1.rb").each do |file|
	result = `git log #{file}`
	lines = result.lines.to_a
	# Date:   Mon Oct 7 19:13:38 2013 +0300
	date_string = lines[2].gsub("Date:", "").strip
	date = DateTime.parse date_string
	puts "#{file}, #{date}"
end
