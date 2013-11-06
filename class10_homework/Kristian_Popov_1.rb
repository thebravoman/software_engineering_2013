require 'rexml/document'

def line(parent, x1,y1,x2,y2)
    r= parent.add_element "line"
    r.attributes["x1"] = x1
    r.attributes["y1"] = y1
    r.attributes["x2"] = x2
    r.attributes["y2"] = y2
    r.attributes["stroke"] = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
end

def coord(parent)
	line(parent, 600,0,600,700)
	line(parent, 0,350,1200,350)
end

doc = REXML::Document.new
el_svg = doc.add_element "svg"
el_svg.attributes["version"] = "1.1"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"

coord(el_svg)

arg = ARGV[1]
i=0

while arg != nil
	y1=0
	x2=0
	x1=(-ARGV[i+1].to_i+y1)/ARGV[i].to_i
	y2=(ARGV[i].to_i*x2)+ARGV[i+1].to_i
	line(el_svg,x1+600,x2+600,350-y1,350-y2)
	i+=2
	arg=ARGV[i+1]
end

File.open("Kristian_Popov_1.svg", "w") do |f|
    f.write(doc.to_s)
end
