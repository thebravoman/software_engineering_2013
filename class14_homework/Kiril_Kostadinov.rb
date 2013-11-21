require 'csv'
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

	def set_fill color
		@fill_color = color
	end

	def rect w, h, x, y
		r = @el_svg.add_element "rect"
		r.attributes["width"] = w
		r.attributes["height"] = h
		r.attributes["x"] = self.x + x
		r.attributes["y"] = self.y - y - h
		r.attributes["stroke"] = "black"
		r.attributes["stroke-width"] = "1"
		r.attributes["fill"] = @fill_color
	end

	def set_stroke color
		@stroke = color
	end

	def line x1, y1, x2, y2
		line = @el_svg.add_element "line"
		line.attributes["x1"] = x1 + self.x
		line.attributes["y1"] = self.y - y1
		line.attributes["x2"] = x2 + self.x
		line.attributes["y2"] = self.y - y2
		line.attributes["style"] = "stroke:#{@stroke};stroke-width:3"
	end

	def text value, x, y
		t = @el_svg.add_element "text"
		t.attributes["x"] = x + self.x
		t.attributes["y"] = self.y - y
		t.attributes["style"] = "fill:black"
		t.text = value
	end
end

class ChartDrawer
	def initialize d
		@drawer = d
	end

	def column_chart csv_file
		data = CSV.read(csv_file)
		draw_lines data
		draw_columns data
		draw_column_names data
	end

	private
	def loop_columns data
		columns = data[0].length - 1
		colors = ["fuchsia", "blue", "yellow", "red", "teal", "lime", "aqua", "purple", "olive", "navy"]
		columns.times do |n|
			yield n, columns, colors[n]
		end
	end

	def  draw_columns data
		loop_columns(data) do |n, columns, color|
			@drawer.set_fill color
			@drawer.rect 40, data[1][n+1].to_i, 40*n, 0
		end
	end

	def draw_column_names data
		loop_columns(data) do |n, columns,color|
			@drawer.set_fill color
			@drawer.rect 20, 20, columns*40 + 50, 400 - n*30
			@drawer.text data[0][n+1], columns*40 + 80, 400 - n*30
		end 
	end

	def draw_lines data
		@drawer.set_stroke "black"
		line_length = (data[1].length-1)*40 + 40
		@drawer.line -50, 0, line_length, 0
		@drawer.text "0", -80, -5
		max = data[1][2..data[1].length].max
		lines_count = (max.to_i/100).floor + 1
		@drawer.set_stroke "gray"
		for i in 1..lines_count do
			@drawer.line -50, i*100, line_length, i*100
			@drawer.text (i*100).to_s, -80, i*100-5
		end
		@drawer.text data[1][0], line_length/2-50, -20  
	end
end

d = Drawer.new "Kiril_Kostadinov.svg", 300, 600
d.start

chart_drawer = ChartDrawer.new d
chart_drawer.column_chart ARGV[0]

d.finish
