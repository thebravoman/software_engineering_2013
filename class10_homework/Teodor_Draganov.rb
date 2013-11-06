require 'rexml/document'

def line(svg,x1,x2,y1,y2,red=0,green=0,blue=0)
        line=svg.add_element "line"
        line.attributes["x1"]=x1
        line.attributes["x2"]=x2
        line.attributes["y1"]=y1
        line.attributes["y2"]=y2
        line.attributes["stroke"]="rgb(#{red},#{green},#{blue})"
        line.attributes["stroke-width"]="2"
end
doc=REXML::Document.new
svg=doc.add_element "svg"
svg.attributes["version"]="1.1"
svg.attributes["xmlns"]="http://www.w3.org/2000/svg"
line(svg,0,1200,350,350)
line(svg,600,600,0,700)
argument=ARGV[1]
i=0
while argument!=nil
        y1=150
        x2=-150
        x1=(-ARGV[i+1].to_i+y1)/ARGV[i].to_i
        y2=(ARGV[i].to_i*x2)+ARGV[i+1].to_i
        line(svg,x1+600,x2+600,350-y1,350-y2,red=rand(255),green=rand(255),blue=rand(255))
        i+=2
        argument=ARGV[i+1]
end
File.open("Teodor_Draganov.svg","w") do |svg|
        svg.write(doc.to_s)
end
