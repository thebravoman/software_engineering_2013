require 'rexml/document'

def rect(parent, w,h)
	r= parent.add_element "rect"
	r.attributes["width"] = w
	r.attributes["height"] = h
	r.attributes["stroke"] = "black"
	r.attributes["stroke-width"] = "2"
	r.attributes["fill"] = "red"
end

def circle(parent, x,y,r,red=0,green=0,blue=255) 
	c = parent.add_element "circle"
	c.attributes["cx"] = x
	c.attributes["cy"] = y
	c.attributes["r"] = r
	c.attributes["stroke"] = "black"
	c.attributes["stroke-width"] = "2"
	c.attributes["fill"] = "rgb(#{red},#{green},#{blue})"
end

doc = REXML::Document.new
el_svg = doc.add_element "svg"
el_svg.attributes["version"] = "1.1"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
20.downto(1) do |i|
	circle(el_svg, 100+i*10,100+i*10,i*10,blue=i*10)
end

20.downto(1) do |i|
	rect(el_svg, i*10,i*10)
end

File.open("result.svg", "w") do |f|
	f.write(doc.to_s)
end
