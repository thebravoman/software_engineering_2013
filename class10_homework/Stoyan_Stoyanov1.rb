require 'rexml/document'

def line(doc, x1, y1, x2, y2)
        line = doc.add_element "line"
        line.attributes["x1"] = x1
        line.attributes["y1"] = y1
        line.attributes["x2"] = x2
        line.attributes["y2"] = y2
        line.attributes["style"] = "stroke:black;stroke-width:4"
end
def draw_cordinatna_sistame(doc, x, y)
        line(doc, x-300, y, x+300, y)
        line(doc, x, y-300, x, y+300)
        line(doc, x+300, y, x+280, y-20)
        line(doc, x+300, y, x+280, y+20)
        line(doc, x, y-300, x-20, y-280)c
        line(doc, x, y-300, x+20, y-280)
end
def drow_line(doc, x1, y1, x2, y2)
        drow_line = doc.add_element "line"
        drow_line.attributes["x1"] = x1
        drow_line.attributes["y1"] = y1
        drow_line.attributes["x2"] = x2
        drow_line.attributes["y2"] = y2
        drow_line.attributes["style"] = "stroke:rgb(#{rand(255)},#{rand(255)},#{rand(255)});stroke-width:3"
end

Apcisa = 600
Ordinata = 350
if ARGV.length < 2
	elsif ARGV.length % 2 != 0
		else
        	result = REXML::Document.new
        	element_result = result.add_element "svg"
        	element_result.attributes["xmlns"] = "http://www.w3.org/2000/svg"
        	element_result.attributes["version"] = "1.1"
        	draw_coord_sys(element_result, Apcisa, Ordinata)

        for i in 0..ARGV.length - 1
                next if i % 2 != 0
        	        x1 = -300
        	        x2 = 300
        	        y1 = ARGV[i].to_i * x1 + ARGV[i + 1].to_i
        	        y2 = ARGV[i].to_i * x2 + ARGV[i + 1].to_i
        	        drow_line(element_result, Apcisa+ x1, Ordinata - y1, Apcisa + x2, Ordinata - y2)
        	end
File.open("Stoyan_Stoyanov.svg", "w") do |file|
	file << result
end
end
