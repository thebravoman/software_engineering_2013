require 'rexml/document'
require 'csv'


class Drawer
	attr_writer :file_name
	attr_reader :file_name
	attr_accessor :x
	attr_accessor :y

	def initialize file_name="result.svg",x,y
		self.file_name=file_name
		self.x=x
		self.y=y
	end

	def line x1,y1,x2,y2
		l=@el_svg.add_element "line"
		l.attributes["x1"]=self.x+x1
		l.attributes["x2"]=self.x+x2
		l.attributes["y1"]=self.y-y1
		l.attributes["y2"]=self.y-y2
		l.attributes["stroke"]="black"
		l.attributes["stroke-width"]="2"
	end

	def set_fill color
		@fill_color=color
	end

	def rect w,h,x,y
		r=@el_svg.add_element "rect"
		r.attributes["width"]=w
		r.attributes["height"]=h
		r.attributes["x"]=self.x+x
		r.attributes["y"]=self.y-h-y
		r.attributes["stroke"]="black"
		r.attributes["stroke-width"]="2"
		r.attributes["fill"]="#{@fill_color}"
	end

	def start
		@doc=REXML::Document.new
		@el_svg=@doc.add_element "svg"
		@el_svg.attributes["version"]="1.1"
		@el_svg.attributes["xmlns"]="http://www.w3.org/2000/svg"
	end

	def finish
		File.open(self.file_name,"w") do |svg|
			svg.write(@doc.to_s)
		end
	end

	def text value,x,y
		t=@el_svg.add_element "text"
		t.attributes["x"]=self.x+x
		t.attributes["y"]=self.y-y
		t.text=value
	end
end

class ChartDrawer
	
	def initialize d
		@drawer = d
	end

	def columns_chart data
		colors = []
		(data[0].length-1).times do |thing|
			colors << "rgb(#{rand(16)*16},#{rand(16)*16},#{rand(16)*16})"
		end
		draw_columns data,colors
		draw_legend data,colors
		draw_names data,colors
		draw_lining data,colors
	end
	
	private 
	def loop_months data,colors
		months = data[0].length - 1
		months.times do |n|
			yield n,months,colors[n]
		end
	end
		
	def draw_lining data,colors
		biggest_val = data[1].last(data[1].length - 1)
		biggest_val.sort_by!{|a| a.to_i}.reverse!
		i = (biggest_val[0].to_i/(data[1].length)).round
		loop_months(data,colors) do |n|
			@drawer.line -30,n*i,(data[0].length - 1)*30,n*i
			@drawer.text (n*i).to_s,-75,n*i
		end
		@drawer.line -30,0,-30,biggest_val[0].to_i
		@drawer.line -30,biggest_val[0].to_i,(data[0].length - 1)*30,biggest_val[0].to_i
		@drawer.text biggest_val[0].to_s,-75,biggest_val[0].to_i
	end
	
	def draw_names data,colors
		loop_months(data,colors) do |n,months|
			@drawer.text data[0][n+1].to_s,n*30 + 3, -15
		end
	end
	
	def draw_legend data,colors
		loop_months(data,colors) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 10,10,months*30 +30,n*30
			@drawer.text data[0][n+1].to_s,months*30 +60,n*30
		end
	end
	
	def draw_columns data,colors
		loop_months(data,colors) do |n,months,color|	
			@drawer.set_fill color
			@drawer.rect 20,data[1][n+1].to_i,n*30,0
		end
	end
	
end

d = Drawer.new "chart.svg", 350,350
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values

d.finish
