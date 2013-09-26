
f = File.open("text_file.csv")
content = f.read
content.each_line do |line|
	puts line.split(",")[1]
end
