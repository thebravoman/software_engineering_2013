require 'rexml/document'

def create_line(svg, x1, y1, x2, y2)
        l = svg.add_element "line"
        l.attributes["x1"] = x1
        l.attributes["y1"] = y1
        l.attributes["x2"] = x2
        l.attributes["y2"] = y2
        l.attributes["stroke-width"] = "2"
		l.attributes["stroke"] = "black"
		end
doc = REXML::Document.new
svg = doc.add_element "svg"
svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
svg.attributes["version"] = "1.1"
	
	create_line(svg,0,350,1200,350)
	create_line(svg,600,0,600,700)
	
	
	argument=ARGV[1]
	i=0
while argument!=nil
        y1=150
        x2=-150
        x1=(-ARGV[i+1].to_i+y1)/ARGV[i].to_i
        y2=(ARGV[i].to_i*x2)+ARGV[i+1].to_i
        create_line(svg,x1+600,x2+600,350-y1,350-y2)
        i+=2
        argument=ARGV[i+1]
	end
		File.open("Nikolai_Dimitrov.svg", "w") do |file|
        file.write(svg.to_s)
end
