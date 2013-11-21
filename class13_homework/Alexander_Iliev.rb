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
	
	def path xbegin,ybegin,xmid,ymid,xend,yend
		p = @el_svg.add_element "path"
		p.attributes["d"] = "M #{xbegin + self.x} #{self.y - ybegin} q #{xmid} #{ymid} #{xend} #{yend}"
		p.attributes["style"] = "fill:none;stroke:green;stroke-width:3"
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

class MathDrawer
	
	def initialize d
		@drawer = d
	end
	
	def quadratic_equation a,b,c
		if a == 0 
			no_quad b,c
		else
			quad a,b,c
		end
	end
	
	def no_quad b,c
		@drawer.line 0,c,-c/b,0
	end
	
	def quad a,b,c
		xmid = -(b/(2*a))
		ymid = ((xmid*xmid*a) + (xmid*b) + c)
		xbegin = 	xmid - 10
		ybegin = ((xbegin*xbegin*a) + (xbegin*b) + c)
		xend = xmid + 10
		@drawer.path xbegin,ybegin,10,-ymid,20,0
	end
	
end

d = Drawer.new "math.svg", 350,300
d.start
d.cs

m = MathDrawer.new d
m.quadratic_equation ARGV[0].to_i,ARGV[1].to_i,ARGV[2].to_i

d.finish

