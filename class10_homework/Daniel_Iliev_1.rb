require "rexml/document"

def make_coord(doc,x1,y1,x2,y2)
	l = doc.add_element "line"
	l.attributes["x1"] = x1
	l.attributes["x2"] = x2
	l.attributes["y1"] = y1
	l.attributes["y2"] = y2
	l.attributes["style"] = "stroke:rgb(255,0,0);stroke-width:2"
end

def user_line(doc,x1,x2,y1,y2)
	l = doc.add_element "line"
	l.attributes["x1"] = x1
	l.attributes["x2"] = x2
	l.attributes["y1"] = y1
	l.attributes["y2"] = y2
	l.attributes["style"] = "stroke:rgb(255,0,0);stroke-width:2"
end

i = 1

if ARGV.length - 1 > 0 && ARGV.length.even?
	while ARGV[i] != nil
		x1 = ((ARGV[i].to_i + 600) + ARGV[i].to_i)
		x2 = ((ARGV[i].to_i + 600) - ARGV[i].to_i)
		y1 = ((ARGV[i].to_i + 350) + ARGV[i].to_i)
		y2 = ((ARGV[i].to_i + 350) - ARGV[i].to_i)	
		i = i + 1 
	end

	doc = REXML::Document.new
	el_svg = doc.add_element "svg"
	el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
	el_svg.attributes["version"] = "1.1"

	make_coord(el_svg,300,350,900,350)
	make_coord(el_svg,600,50,600,650)
	user_line(el_svg,x1,x2,y1,y2)

	File.open("Daniel_Iliev_1.svg", "w") do |file|
		file.write(doc.to_s)
	end
else
	puts "Invalid number of arguments"
end
