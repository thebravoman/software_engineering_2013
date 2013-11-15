require "rexml/document"
require 'csv'

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
	  l.attributes["style"] = "stroke:black;stroke-width:1"
	end
	
	def text value, x, y
		t = @el_svg.add_element "text"
		t.attributes["x"] = x + self.x
		t.attributes["y"] = self.y - y
		t.text = value
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

	def columns_chart data
		draw_columns data
		draw_legend data
		draw_values_lines data
	end
	
	private 
	def loop_months data
		months = data[0].length - 1
		colors = ["orange","green","red","black"]
		months.times do |n|
			yield n,months,colors[n]
		end
	end
	
	def draw_legend data
		loop_months(data) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 13,13,months*30 +30,n*30
			@drawer.text data[0][n+1].to_s,months*30 +60,n*30
		end
	end
	
	def draw_columns data
		loop_months(data) do |n,months,color|	
			@drawer.set_fill color
			@drawer.rect 20,data[1][n+1].to_i,n*30,0
	end
		end


	def draw_values_lines data
		loop_months(data) do |n,months,color|	
			@drawer.line n-30,data[1][n+1].to_i,80,data[1][n+1].to_i # lines(values)
			@drawer.text "#{data[1][n+1].to_i}",n-70,data[1][n+1].to_i # values
			
			@drawer.line -30,data[1][n+1].to_i-data[1][n+1].to_i,175,data[1][0].to_i # line-0
			@drawer.text "#{data[0][1].to_i}",-70,data[0][0].to_i # 0
						

			@drawer.text "#{data[1][0].to_s}",0,-20 # Expence

			@drawer.set_fill color
			@drawer.rect 20,data[1][n+1].to_i,n*30,0
		end
	end
	

	
end

d = Drawer.new "Denis_Kalfov.svg", 350,350
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values 

d.finish
