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
	  l.attributes["y1"] = self.y - y1
	  l.attributes["y2"] = self.y - y2
	  l.attributes["style"] = "stroke:black;stroke-width:2"
	end
	
	def cs
		line(0,200,0,-200)
		line(200,0,-200,0)
	end

	def text value, x, y
		t = @el_svg.add_element "text"
		t.attributes["x"] = x + self.x
		t.attributes["y"] = self.y - y
		t.text = value
	end
	
	def point x,y
		circle x,y,3
	end

	def finish
		File.open(self.file_name, "w") do |f|
			f.write(@doc.to_s)
		end
	end
	
end

class MathDrawer
	
	def initialize d
		@drawer = d
	end
	
	def line a, b
		@drawer.line 0,b,-b/a,0
	end

	def quadratic_equation a,b,c
		a= a
		b= b
		c= c

		x = (-b)/(2*a)
		i = x + 5
		while i+ 10 > x
			y = (a*(i**2) + (b*i   ) + c)*20
			@drawer.line i*20,y,(i+0.15)*20,(y+0.15) 
			i = i - 0.001
		end

	end

	
end

d = Drawer.new "Luboslav_Ivanov.svg", 650,300
d.start
d.cs
 
m = MathDrawer.new d
m.quadratic_equation 2,1,-2
d.finish

