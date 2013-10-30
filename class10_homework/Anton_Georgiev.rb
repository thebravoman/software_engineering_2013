require 'rexml/document'

def line(parent,x1,x2,y1,y2,red=0,green=0,blue=255)
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
line(el_svg,50,650,600,600)
line(el_svg,350,350,300,900)

c=ARGV[1]
i=0
while c!=nil
	x1=ARGV[i].to_i/ARGV[i+1].to_i
	y1=0
	x2=0
	y2=ARGV[i+1].to_i
	line(el_svg,x1+450,x2+250,y1+700,y2+500,red=i+1,green=(i+1)*10,blue=(i+1)*50)
	i+=2
	c=ARGV[i+1]
end

File.open("Anton_Georgiev.svg","w") do |svg|
	svg.write(doc.to_s)
end
