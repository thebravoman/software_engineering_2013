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
		draw_columns data
		draw_columns_names data
		draw_lines data
		chart_text data 
		chart_numbers data
        end
        
        private
        def loop_months data
                months = data[0].length-1
                colors = ["green","yellow","red","white","blue","red","orange","pink",]
                months.times do |n|
                        yield n,months,colors[n]
                end
        end
        
	
	def draw_columns_names data
		loop_months(data) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 16,16,180,300 - (n*20)
			@drawer.text data[0][n+1].to_s,200,300 - (n*20)
		end
	end
        
        def draw_columns data
                loop_months(data) do |n,months,color|
                        @drawer.set_fill color
                        @drawer.rect 40,data[1][n+1].to_i,(n*40),0
                end
        end
		
	def draw_lines data
			@drawer.line 80,200,-150,200
			@drawer.line 80,300,-150,300
			@drawer.line 40,100,-150,100
			@drawer.line 80,0,-150,0
		end
		
		end
		def chart_text data
                loop_months(data) do |n|
                        @drawer.text "#{data[1][0].to_s}",40,-12
                end
		
			end
		def chart_numbers data
			@drawer.text "#{data[1][1].to_s}",-180,95
			@drawer.text "#{data[1][2].to_s}",-180,195
			@drawer.text "#{data[1][3].to_s}",-180,295
			@drawer.text "0",-160,-5
		
				
		
		end
		
d = Drawer.new "chart.svg", 300,350
d.start

chart_drawer = ChartDrawer.new d

chart_drawer.column_chart ARGV[0]

d.finish
