require 'csv'
require 'rexml/document'

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

	def set_fill color
		@fill_color = color
	end
	
	def rect w, h, x, y
		r= @el_svg.add_element "rect"
		r.attributes["width"] = w
		r.attributes["height"] = h
		r.attributes["x"] = self.x + x
		r.attributes["y"] = self.y - y - h
		r.attributes["stroke"] = "black"
		r.attributes["stroke-width"] = "2"
		r.attributes["fill"] = @fill_color
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
		circle x,y,5
	end
	
	def finish
		File.open(self.file_name, "w") do |f|
			f.write(@doc.to_s)
		end
	end
	
end

class ChartDrawer

	def initialize d
		@drawer = d
	end

	def column_chart csv_file
		data = CSV.read(csv_file)
		draw_chart_cs
		draw_columns data
		draw_column_names data
		draw_chart_graphs data
		draw_chart_text data
		
	end

	private
	def loop_months data
		months = data[0].length	- 1
		colors = ["blue", "red", "orange", "pink"]
		months.times do |n|
			yield n, months, colors[n]
		end
	end

	def draw_column_names data
		loop_months(data) do |n, months, color|
			@drawer.set_fill color
			@drawer.rect 40, 40, (months * 40) +  100, n * 41
			@drawer.text data[0][n + 1], (months * 40) + 100 + 40, n * 41
		end
	end

	def draw_columns data
		loop_months(data) do |n, months, color|
			@drawer.set_fill color
			@drawer.rect 40, data[1][n + 1].to_i, (n * 40), 0
		end
	end
	
	def draw_chart_cs
		@drawer.line(-100, 450, -100, 0)
		@drawer.line(200, 0, -100, 0)
	end
	
	def draw_chart_graphs data
		@drawer.line(-100, data[1][1].to_i, 40, data[1][1].to_i);
		@drawer.line(-100, data[1][2].to_i, 80, data[1][2].to_i);
		@drawer.line(-100, data[1][3].to_i, 120, data[1][3].to_i);
	end

	def draw_chart_text data
		@drawer.text(data[1][0], 25, -25)
		@drawer.text("0", -110, -10)
		@drawer.text(data[1][1], -130, data[1][1].to_i);
		@drawer.text(data[1][2], -130, data[1][2].to_i);
		@drawer.text(data[1][3], -130, data[1][3].to_i);
	end

end

d = Drawer.new "chart.svg", 300, 500
d.start

chart_drawer = ChartDrawer.new d

chart_drawer.column_chart ARGV[0]

d.finish
