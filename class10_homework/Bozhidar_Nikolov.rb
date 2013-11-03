require 'rexml/document'

def make_line(doc, x1, y1, x2, y2, red, green, blue)
	line = doc.add_element "line"
	line.attributes["x1"] = x1
	line.attributes["y1"] = y1
	line.attributes["x2"] = x2
	line.attributes["y2"] = y2
	line.attributes["style"] = "stroke:rgb(#{red},#{green},#{blue});stroke-width:2"
end

doc = REXML::Document.new
svg = doc.add_element "svg"
svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
svg.attributes["version"] = "1.1"
make_line(svg, 250, 350, 950, 350, 0, 0, 0)
make_line(svg, 600,  0, 600, 700, 0, 0, 0)

if ARGV.length % 2 == 1 || ARGV.length == 0
	abort("Wrong number of arguments!")
else
	current_argument = Array.new()
	next_argument = Array.new()
	i = 0

	ARGV.each do |arg|
		case i
		when 0
			current_argument << arg.to_i
			i = 1
		when 1
			next_argument << arg.to_i
			i = 0
		end
	end
	
	current_argument.each do |arg1|
		next_argument.each do |arg2|
			x1 = 100
			x2 = -100
			y1 = arg1 * x1 + arg2
			y2 = arg1 * x2 + arg2
			make_line(svg, 600 + x1, 350 - y1, 600 + x2, 350 - y2, rand(255), rand(255), rand(255))
		end
	end
end
	

File.open("Bozhidar_Nikolov.svg", "w") do |file|
	file.write(svg.to_s)
end
