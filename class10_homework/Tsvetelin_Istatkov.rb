require 'rexml/document'

def line (doc,x1,y1,x2,y2,red=0,green=0,blue=0)
l = doc.add_element "line"
l.attributes["x1"] = x1
l.attributes["y1"] = y1
l.attributes["x2"] = x2
l.attributes["y2"] = y2
l.attributes["stroke-widght"] = "10"
l.attributes["stroke"] = "rgb(#{green},#{red},#{blue})"
end

doc = REXML::Document.new
el_svg = doc.add_element "svg"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
el_svg.attributes["version"] = "1.1"



line(el_svg, 600,50,600,1000)
line(el_svg, 220,350,1000,350)

c=ARGV[1]
i=0
while c!=nil
        y1=150
        x2=-150
        x1=(-ARGV[i+1].to_i+y1)/ARGV[i].to_i
        y2=(ARGV[i].to_i*x2)+ARGV[i+1].to_i
        line(el_svg,x1+600,x2+600,350-y1,350-y2,red=rand(255),green=rand(255),blue=rand(255))
        i+=2
        c=ARGV[i+1]
end





File.open("Tsvetelin_Istatkov.svg","w") do |f|
	f.write(doc.to_s)
end
