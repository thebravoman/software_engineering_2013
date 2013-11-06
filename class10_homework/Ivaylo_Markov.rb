require 'rexml/document'

def draw_line(svg,x1,y1,x2,y2,r=0,g=0,b=0)
    c = svg.add_element("line")
    c.attributes["x1"] = x1
    c.attributes["y1"] = y1
    c.attributes["x2"] = x2
    c.attributes["y2"] = y2
    c.attributes["stroke-width"] = "2"
    c.attributes["stroke"] = "rgb(#{r},#{g},#{b})"

end

doc = REXML::Document.new
svg = doc.add_element("svg")
svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
svg.attributes["version"] = "1.1"

draw_line(svg,0,350,1200,350,111,121,111)
draw_line(svg,600,700,600,0,121,111,121)

i = 0
y1=150
x2=-150

while(i<(ARGV.count - 1))
	n1 = ARGV[i].to_i
	i+=1
	n2 = ARGV[i].to_i
    x1=(-n2+y1)/n1
    y2=(n1*x2)+n2
	Random.srand()
	draw_line(svg,x1+600,y1+350,x2+600,y2+350,rand(255),rand(255),rand(255))
	i+=1
end


File.open("Ivaylo_Markov.svg","w") do |out|
	out << svg.to_s
end
