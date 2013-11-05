require "rexml/document"

class Drawer

	attr_writer :file_name
	attr_reader :file_name
	
	attr_accessor :x
	attr_accessor :y
	
	def initialize file_name="result.svg",x=200,y=200
		self.file_name = file_name
		self.x = x
		self.y = y
	end
	
	def rect w, h
		r= @el_svg.add_element "rect"
		r.attributes["width"] = w
		r.attributes["height"] = h
		r.attributes["x"] = self.x
		r.attributes["y"] = self.y-h
		r.attributes["stroke"] = "black"
		r.attributes["stroke-width"] = "2"
		r.attributes["fill"] = "red"
	end
	
	def circle x,y,r
		c = @el_svg.add_element "circle"
		c.attributes["cx"] = self.x + x
		c.attributes["cy"] = self.y - y
		c.attributes["r"] = r
		c.attributes["stroke"] = "black"
		c.attributes["stroke-width"] = "2"
		c.attributes["fill"] = "red"
	end
	
	def start
		@doc = REXML::Document.new
		@el_svg = @doc.add_element "svg"
		@el_svg.attributes["version"] = "1.1"
		@el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
	end
	
	def line x1,y1,x2,y2
	  l = @el_svg.add_element "line"
	  l.attributes["x1"] = x1+self.x
	  l.attributes["x2"] = x2+self.x
	  l.attributes["y1"] = y1+self.y
	  l.attributes["y2"] = y2+self.y
	  l.attributes["style"] = "stroke:black;stroke-width:2"
	end
	
	def cs
		line(0,200,0,-200)
		line(200,0,-200,0)
	end
	
	def finish
		File.open(self.file_name, "w") do |f|
			f.write(@doc.to_s)
		end
	end
	
end

drawer = Drawer.new "result.svg", 300,400
drawer.start
drawer.cs
drawer.rect 100, 100
drawer.circle 200,200,70
drawer.finish
