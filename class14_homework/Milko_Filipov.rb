require 'csv'
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
      	draw_chart data
            draw_columns data
            draw_legend data
    end
        
    private
    def loop_months data
            months = data[0].length - 1
            colors = ["pink", "red", "green", "orange","black","yellow","purple","blue","gold"]
            months.times do |n|
                    yield n,months,colors[n]
                    
            end
    end
        
    def draw_chart data
		i=1
		max = 0
		while i < data[1].length
			if max < data[1][i].to_i
				max = data[1][i].to_i
			end
			i+=1
		end
		i=0
		m = (max/25).to_i + 1
		y=((data[1].length).to_i-1)*30
		while i<m
			if i.odd? == false 
				y+=30
				@drawer.text (i*25).to_s,y,i*25
			else
				y-=30
			end
			@drawer.line -20,i*25,y,i*25
			i+=1
		
		end
		@drawer.line -20,0,-20,max
		@drawer.text data[1][0].to_s,-10,-20	
    end
        

        
    def draw_legend data
            loop_months(data) do |n,months,color|
                    @drawer.set_fill color
                    @drawer.rect 10,10,months*30 +80,n*30
                    @drawer.text data[0][n+1].to_s,months*30 +100,n*30
            end
    end
        
    def draw_columns data
		y=0
        loop_months(data) do |n,months,color|        
			@drawer.set_fill color
			@drawer.rect 20,data[1][n+1].to_i,n*30,0
                        
        end
    end
        
end

d = Drawer.new "chart.svg", 400,500
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values

d.finish
