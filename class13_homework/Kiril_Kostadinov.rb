require 'rexml/document'

class Drawer
	attr_accessor :file_name
	attr_accessor :x, :y

	def initialize a_file_name="result.svg", x=200, y=200
		self.file_name = a_file_name
		self.x = x
		self.y = y
	end

	def start
		@doc = REXML::Document.new
		@el_svg = @doc.add_element "svg"
		@el_svg.attributes["version"] = "1.1"
		@el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
	end

	def finish
		File.open(file_name, "w") do |f|
			f.write(@doc.to_s)
		end
	end

	def line x1, y1, x2, y2
		line = @el_svg.add_element "line"
		line.attributes["x1"] = x1 + self.x
		line.attributes["y1"] = self.y - y1
		line.attributes["x2"] = x2 + self.x
		line.attributes["y2"] = self.y - y2
		line.attributes["style"] = "stroke:#{@color};stroke-width:3"
	end

	def cs
		set_color "black"
		line 0, 200, 0, -200
		line 200, 0, -200, 0
		for i in -10..9
			line i*20, 5, i*20, -5
			line 5, i*20, -5, i*20
		end
		line 200, 0, 180, 20
		line 200, 0, 180, -20
		line 0, 200, -20, 180
		line 0, 200, 20, 180
	end

	def set_color color
		@color = color
	end

	def path x1, y1, x2, y2, x3, y3
		path = @el_svg.add_element "path"
		path.attributes["d"] = "M#{x1+self.x},#{self.y-y1} Q#{x2+self.x},#{self.y-y2} #{x3+self.x},#{self.y-y3}"
		path.attributes["style"] = "stroke:#{@color};stroke-width:4;fill:none"
	end
end

class MathDrawer
	def initialize drawer
		@drawer = drawer
	end

	def line a, b
		x1 = -200
		x2 = 200
		y1 = a * x1 + b
		y2 = a * x2 + b
		@drawer.line x1, y1, x2, y2
	end

	def quadratic a, b, c
		@drawer.set_color "blue"
		if a == 0
			line b, c
		else
			x = -b/(2*a)
			y = a*(x**2) + b*x + c
			x1 = x - 150
			y1 = a*(x1**2) + b*x1 + c
			x2 = x + 150
			y2 = a*(x2**2) + b*x2 + c
			@drawer.path x1, y1, x1, y, x, y
			@drawer.path x2, y2, x2, y, x, y
		end
	end
end

d = Drawer.new "Kiril_Kostadinov.svg", 600, 350
d.start
d.cs
m = MathDrawer.new d
m.quadratic ARGV[0].to_f, ARGV[1].to_f, ARGV[2] .to_f
d.finish