require 'rexml/document'

def line(doc,x1,y1,x2,y2,red,green,blue)
	line = doc.add_element "line"
	line.attributes["x1"] = x1
	line.attributes["y1"] = y1
	line.attributes["x2"] = x2
	line.attributes["y2"] = y2
	line.attributes["style"] = "stroke:rgb(#{red},#{green},#{blue})"
	line.attributes["stroke-width"] = 3
end 

def coordinate_system(doc,x1,y1,x2,y2)
        cod_sys=doc.add_element "line"
        cod_sys.attributes["x1"]=x1
        cod_sys.attributes["y1"]=y1
        cod_sys.attributes["x2"]=x2
        cod_sys.attributes["y2"]=y2
        cod_sys.attributes["stroke"]="black"
        cod_sys.attributes["stroke-width"]="3"
end


doc = REXML::Document.new
el_svg = doc.add_element "svg"
el_svg.attributes["version"] = "1.1"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
if (ARGV.length > 1) && (ARGV.length.even?)
	coordinate_system(el_svg,300,350,900,350)
	coordinate_system(el_svg,600,50,600,650)
	i = 0
		while i < ARGV.length - 1
			x1 = 150
			x2 = -150
			y1 = ARGV[i].to_i * x1 + ARGV[i+1].to_i
			y2 = ARGV[i].to_i * x2 + ARGV[i+1].to_i
			line(el_svg,x1 + 600,350 - y1,x2 + 600,350 - y2, rand(255), rand(255), rand(255))
			i += 2
		end
else
	p "Invalid argument input"
end
File.open("Nedelcho_Delchev.svg","w") do |svg|
        svg.write(doc.to_s)
end