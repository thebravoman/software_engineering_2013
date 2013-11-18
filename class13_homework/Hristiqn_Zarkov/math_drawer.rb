require_relative "drawer"
class MathDrawer
	
	def initialize d
		@drawer = d
	end
	
	def line a, b
	        @drawer.set_fill        
		@drawer.line 0,b,-b/a,0
	end
	def quadratic a,b,c
	        d = b*b - 4*a*c
	        mid_x = -b/(2*a)
	        mid_y = a*mid_x*mid_x + b*mid_x + c
	        y1 = 0
	        y2 = 0
	        if (d == 0)
	                x1 = (-b/(2*a))*10
	                x2 = x1
	        elsif (d < 0)
	                d = -d;
	                x1 = (-b - Math.sqrt(d).to_i)/(2*a)
	                y1 = a*x1*x1 + b*x1 + c
	                x2 = (-b + Math.sqrt(d).to_i)/(2*a)
	                y2 = a*x2*x2 + b*x2 + c
	        else
	                x1 = (-b - Math.sqrt(d).to_i)/(2*a)
	                x2 = (-b + Math.sqrt(d).to_i)/(2*a)
	        end
	        @drawer.set_fill
	        @drawer.path x1,y1,mid_x,mid_y,x2,y2
	end
	
end

d = Drawer.new "math.svg",300,350
d.start
d.cs

m = MathDrawer.new d
m.line 1, 100
m.quadratic 1,-8,7

d.finish

