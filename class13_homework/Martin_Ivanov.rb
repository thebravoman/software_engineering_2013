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
        
        def circle x,y,r
                c = @el_svg.add_element "circle"
                c.attributes["cx"] = self.x + x
                c.attributes["cy"] = self.y - y
                c.attributes["r"] = r
                c.attributes["stroke"] = "black"
                c.attributes["stroke-width"] = "2"
                c.attributes["fill"] = "black"
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
                
                i = -200
                while i < 200
                        line(5,i,-5,i)
                        line(i,5,i,-5)
                        i = i + 20
                end
        end

        def text value, x, y
                t = @el_svg.add_element "text"
                t.attributes["x"] = x + self.x
                t.attributes["y"] = self.y - y
                t.text = value
        end
        
        def point x,y
                circle x,y,2
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
        
        def line a, b
                @drawer.line 0,b,-b/a,0
        end
        
        def graph
                a = 1
                b = 3
                c = -4
                d = ((b*b) - (4*a*c))
                vruh_x = (-b.to_f/(2*a.to_f))
                vruh_y = (-d.to_f/(4*a.to_f))
                @drawer.point(vruh_x*20,vruh_y*20)
                x1 = vruh_x
                y1 = vruh_y
                5.times do |x2|
                        y2 = (a*(x2*x2)) + (b*x2) + c
                        @drawer.point(x2*20,y2*20)
                        @drawer.line(x1*20,y1*20,x2*20,y2*20)
                        @drawer.point(-((x2*20)-(vruh_x*40)),y2*20)
                        @drawer.line(-((x1*20)-(vruh_x*40)),(y1*20),-((x2*20)-(vruh_x*40)),y2*20)
                        x1 = x2
                        y1 = y2
                end
        end
        
end

d = Drawer.new "math.svg", 350,300
d.start
d.cs
m = MathDrawer.new d
m.graph

d.finish
