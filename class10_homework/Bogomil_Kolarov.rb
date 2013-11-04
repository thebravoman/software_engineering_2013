require 'rexml/document'

def draw_coordinate(svg,x1, y1, x2, y2 )
	line = svg.add_element "line"
	line.attributes["x1"] = x1
	line.attributes["y1"] = y1
	line.attributes["x2"] = x2
	line.attributes["y2"] = y2
	line.attributes["stroke-width"] = "2"
	line.attributes["stroke"] = "black"
end

def draw_line(svg, x1, y1, x2, y2)
	line = svg.add_element "line"
	line.attributes["x1"] = x1 + 600
	line.attributes["y1"] = 350 - y1
	line.attributes["x2"] = x2 + 600
	line.attributes["y2"] = 350 - y2
	line.attributes["stroke-width"] = "2"
	line.attributes["stroke"] = "rgb(#{rand(255)}, #{rand(255)}, #{rand(255)})"
end

unless ARGV.length.odd? || ARGV.length < 1
	doc = REXML::Document.new
	el_svg = doc.add_element "svg"
	el_svg.attributes["version"] = "1.1"
	el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
	draw_coordinate(el_svg, 0, 350, 5000, 350)
	draw_coordinate(el_svg, 600, 0, 600, 5000)

	arg_count = ARGV.length	
	count = 0
	while count < arg_count do
		x1 = 100
		x2 = -100
		y1 = ARGV[count].to_f * x1 + ARGV[count + 1].to_f
		y2 = ARGV[count].to_f * x2 + ARGV[count + 1].to_f

		draw_line(el_svg, x1, y1, x2, y2)
		count += 2
	end

	File.open("Bogomil_Kolarov.svg", "w") do |f|
        f.write(doc.to_s)
	end
end
