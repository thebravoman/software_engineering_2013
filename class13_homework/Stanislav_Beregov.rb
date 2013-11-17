require "rexml/document"

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

def linear x, a, b
    return a*x + b
end

def quadratic x, a, b, c
    h = (-b)/(2*a)
    k = a*h*h + b*h + c
    return a*(x-h)*(x-h) + k
end

def draw a, b, c, drawer
    -1200.upto 1200 do |x|
          drawer.setclr x
          if a == 0 
             y1 = linear x,   b, c
             y2 = linear x+1, b, c
          else
              y1 = quadratic x,   a, b, c
              y2 = quadratic x+1, a, b, c
          end
          drawer.line x,y1,x+1,y2
    end
end

d = Drawer.new "Stanislav_Beregov.svg", 400, 400
d.start
d.setclr 0
d.cs
#draw -0.001, 1, 100, d
ARGV.each_slice(3) do |arg|

        draw arg[0].to_f, arg[1].to_f, arg[2].to_f, d
end
d.finish
