require_relative "drawer"

class MathDrawer
        
       def initialize d
                @drawer = d
       end
        
       def line a, b
                @drawer.line 0,b,-b/a,0
       end
        
	     def sqr_func a, b, c, x
		            y = a*x*x + b*x + c
		            return y	
	     end 

       def parabola a, b, c
			          i=-195
		 	          while i<200
				            @drawer.line(i-5, sqr_func(a,b,c,i-5), i, sqr_func(a,b,c,i))
				            i+=5
			          end
       end 
end

d = Drawer.new "math.svg", 350,300
d.start
d.cs

m = MathDrawer.new d
#m.line 1, 100
m.parabola 0.1,-8,2

d.finish
