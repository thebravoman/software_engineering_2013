require_relative "drawer"

class MathDrawer
	
	def initialize d
		@drawer = d
	end

	def line a, b
		@drawer.line a,a,b,b
	end
	
	def quadratic_equation arr
		a = arr[0]
		b = arr[1]
		c = arr[2]
		
		for x in -99..100
			y = a*(x**2)+ b*x + c
			
			if y > 600 
				x1 = x
				y1 = y
			elsif y < -600
				x1 = x
				y1 = y
			else 
				@drawer.line x*10,y,x1*10,y1
				x1 = x
				y1 = y
			end
				
		
		end
	end

	def are_arguments_okay 
		if ARGV.length != 3
			a = 3
			b = 2
			c = 1
		else
			a =ARGV[0].to_i
			b = ARGV[1].to_i
			c = ARGV[2].to_i

		end
		return a,b,c
	end

end

d = Drawer.new "math.svg", 600,350
d.start
d.cs

m = MathDrawer.new d

m.quadratic_equation m.are_arguments_okay
d.finish

