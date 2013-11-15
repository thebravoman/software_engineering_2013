require 'csv'
require 'rexml/document'

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
		(data[0].length-1).times do |n|
			colors << "rgb(#{rand(16)*16},#{rand(16)*16},#{rand(16)*16})"
		end
		draw_columns data,colors
		draw_legend data,colors
	end
	
	private
	def graph n
		i=1
		while i<11
			@drawer.line 0,i*50,n*30+20,i*50
			@drawer.text (i*50).to_s,-20,i*50
			i+=1
		end
	end

	def draw_legend data,color
		i=0
		data[0].each do |n|
			if i>0
				@drawer.set_fill color[i-1]
				@drawer.rect 20,20,(data[0].length-1)*30 +30,i*30
				@drawer.text data[1][i],(data[0].length-1)*30 +60,i*30
			end
			i+=1
		end
	end
	
	def draw_columns data,color
		graph data[0].length - 1
		i=0
		data[0].each do |n|
			if i>0
				@drawer.set_fill color[i-1]
				@drawer.rect 20,n.to_i,i*30,0
				@drawer.text data[1][i],i*30,-20
			end
			i+=1
		end
		@drawer.line 30,-30,(i-1)*30+30,-30
		@drawer.text data[1][0],(i-1)*15,-45
	end
	
end

d = Drawer.new "chart.svg", 350,350
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values

d.finish
