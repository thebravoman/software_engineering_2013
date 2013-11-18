require_relative "drawer"

class MathDrawer
	
	def initialize d
		@drawer = d
	end
	
	def polyline(arr)
		@drawer.polyline arr
	end
	def line a, b
		@drawer.line a,a,b,b
	end
	
	def quadratic_equation a,b,c
		arr = Array.new(0)
		x1 = -100
		y1 = a*(x1**2) + b*x1 + c 
		for x in -99..100
			y = a*(x**2)+ b*x + c
			if y < 600 && y > -600
				@drawer.line x*10,y,x1*10,y1
				x1 = x
				y1 = y
			else 
				x1 = x
				y1 = y
			end
		end
	end
end

d = Drawer.new "math.svg", 600,350
d.start
d.cs

m = MathDrawer.new d
if ARGV.length != 3
	a = 3
	b = 2
	c = 1
else
	a =ARGV[0].to_i
	b = ARGV[1].to_i
	c = ARGV[2].to_i
end
m.quadratic_equation a,b,c
d.finish

