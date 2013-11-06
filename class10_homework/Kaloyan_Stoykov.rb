require 'rexml/document'

def line(parent,x1,x2,y1,y2,red=0,green=0,blue=0)
	l=parent.add_element "line"
	l.attributes["x1"]=x1
	l.attributes["x2"]=x2
	l.attributes["y1"]=y1
	l.attributes["y2"]=y2
    l.attributes["stroke"]="rgb(#{red},#{green},#{blue})"
    l.attributes["stroke-width"]="2"
end

doc=REXML::Document.new
el_svg=doc.add_element "svg"
el_svg.attributes["version"]="1.1"
el_svg.attributes["xmlns"]="http://www.w3.org/2000/svg"
line(el_svg,0,1200,350,350)
line(el_svg,600,600,0,1200)

arguments = ARGV[1]
i = 0
color = 50
while (arguments !=nil)
	y1 = 500
	x1 = (-ARGV[i+1].to_i+ y1)/ARGV[i].to_i
	x2 = -500
	y2 = (ARGV[i].to_i*x2) + ARGV[i+1].to_i
	i+=2
	arguments = ARGV[i+1]
	line(el_svg,x1+600,x2+600,350-y1,350-y2,red=i+color,green=i+color,blue=i+color)
end
File.open("Kaloyan_Stoykov.svg","w") do |svg|
        svg.write(doc.to_s)
end
