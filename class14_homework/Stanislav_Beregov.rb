require "rexml/document"
require 'csv'

class Drawer

        attr_accessor :file_name
        attr_accessor :x
        attr_accessor :y
        
        def initialize file_name="result.svg",x=200,y=200
                self.file_name = file_name
                self.x = x
                self.y = y
        end
        
        def start
                @doc = REXML::Document.new
                el = @doc.add_element "svg"
                el.attributes["version"] = "1.1"
                el.attributes["xmlns"] = "http://www.w3.org/2000/svg"
                @el_svg = el.add_element "g"
                @el_svg.attributes["transform"] = "translate(#{x},#{y})"
        end
        
        def setclr val
            @clr = "rgb(#{((255-val*0.6) % 255).to_i},#{((val*4) % 255).to_i},#{((val*0.42/0.4) % 255).to_i})"
        end
        
        def rect w, h, x ,y
                r= @el_svg.add_element "rect"
                r.attributes["width"] = w
                r.attributes["height"] = h
                r.attributes["x"] = x
                r.attributes["y"] = -h - y
                r.attributes["stroke"] = "black"
                r.attributes["stroke-width"] = "2"
                r.attributes["fill"] = @clr
        end
        
        def circle x,y,r
                c = @el_svg.add_element "circle"
                c.attributes["cx"] = x
                c.attributes["cy"] = -y
                c.attributes["r"] = r
                c.attributes["stroke"] = "black"
                c.attributes["stroke-width"] = "2"
                c.attributes["fill"] = @clr
        end
        
        def line x1,y1,x2,y2
         l = @el_svg.add_element "line"
         l.attributes["x1"] = x1
         l.attributes["x2"] = x2
         l.attributes["y1"] = -y1
         l.attributes["y2"] = -y2
         l.attributes["style"] = "stroke:#{@clr};stroke-width:1"
        end
        
        def cs
                line(0,900,0,-900)
                line(900,0,-900,0)
        end
        
        def text val, x, y
            t = @el_svg.add_element "text"
            t.attributes["x"] = x
            t.attributes["y"] = -y
            t.text = val
        end
        
        def point x, y
            circle x, y, 5
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
        @maxY = 0
        @maxX = 0
    end
    
    def columns_chart data
        draw_columns data
        draw_legend data
        draw_scale
    end
    
    private
    
    def loop_months data
        months = data[0].size - 1
        months.times do |n|
             @drawer.setclr data[1][n+1].to_i
            yield n
        end
     end
     
    def draw_scale
        0.step(@maxY, 20) do |c| 
            @drawer.text c, -50, c-5
            @drawer.setclr 0
            @drawer.line -20,c,@maxX,c
        end
    end
    
    def draw_columns data
        loop_months(data) do |n|
            @drawer.rect 20, data[1][n+1].to_i, n*30, 0
            @maxY = @maxY <  data[1][n+1].to_i ? data[1][n+1].to_i : @maxY
        end
        @maxX = (data[0].size-1)*30
    end
    
    def draw_legend data
        @drawer.text data[1][0].to_s,5,-15
        loop_months(data) do |n|
            @drawer.rect 10,10,@maxX+5,n*30
            @drawer.text data[0][n+1].to_s,@maxX+20,n*30
        end
    end
    
end

d = Drawer.new "chart.svg", 400, 400
d.start
d.setclr 0
d.cs
chart_drawer = ChartDrawer.new d
array_of_vals = CSV.read('data.csv')
chart_drawer.columns_chart array_of_vals
d.finish
