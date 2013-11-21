require_relative "drawer"

class MathDrawer        
	def initialize d
		@drawer = d
	end
	
	def line a, b
		@drawer.line 0,b,-b/a,0
	end       
	
	def sqrt a, b, c, x
		y = a*x*x + b*x + c
	end 
	
	def Quadrantic a, b, c
		if a!=0	
			i=-200
			while i<200
				@drawer.line(i-5, sqrt(a,b,c,i-5), i, sqrt(a,b,c,i))
				i+=1
			end
		else
			p "Potato"
		end
	end 
end

d = Drawer.new "Daniel_Iliev_1.svg", 350,300
d.start
d.cs

m = MathDrawer.new d
m.Quadrantic ARGV[0].to_f , ARGV[1].to_f , ARGV[2].to_f

d.finish
