require 'rexml/document'

class Drawer
	attr_writer :file_name
    attr_reader :file_name
    
    attr_accessor :x
    attr_accessor :y
    
    def initialize file_name="result.svg",x,y
        self.file_name = file_name
        self.x = x
        self.y = y
    end

	def line x1,y1,x2,y2
            l=@el_svg.add_element "line"
            l.attributes["x1"]=x1
            l.attributes["x2"]=x2
            l.attributes["y1"]=y1
            l.attributes["y2"]=y2
            l.attributes["stroke"]="black"
            l.attributes["stroke-width"]="2"
    end

	def start
        @doc = REXML::Document.new
        @el_svg = @doc.add_element "svg"
        @el_svg.attributes["version"] = "1.1"
        @el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
    end
	
	def draw_parabola x1,y1,xp,yp,x2,y2
		p=@el_svg.add_element "path"
        p.attributes["d"]="M #{self.x+x1} #{self.y-y1} q #{xp} #{yp} #{x2} #{y2}"
        p.attributes["fill"]="none"
        p.attributes["stroke"]="blue"
        p.attributes["strike-width"]="2"
	end

	 def cs
        line(150,self.y,450,self.y)
        line(self.x,150,self.x,450)
     end

	
	def finish
        File.open(self.file_name, "w") do |f|
                f.write(@doc.to_s)
        end
    end
end
class QuadraticEquation
	attr_accessor :x
    attr_accessor :y

	def initialize d
		    @drawer=d
	end
	
	def quad_equation a,b,c,x
		a*x*x + b*x + c
	end
	
	def calculate_equation a,b,c
		xp = -( b /(2*a) )
		yp = quad_equation a,b,c,xp
		x1 = xp - 12.5  
		x2 = xp + 12.5
		y1 = quad_equation a,b,c,x1
		y2 = quad_equation a,b,c,x2		
		@drawer.draw_parabola x1,y1,xp-x1,(y1-yp)*2,x2-x1,0
	end
end

d = Drawer.new "chart.svg",300,300
qe = QuadraticEquation.new d
d.start
d.cs 
qe.calculate_equation ARGV[0].to_f,ARGV[1].to_f,ARGV[2].to_f
d.finish
