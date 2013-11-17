
class MathDrawer
	def initialize d 
		@drawer=d
	end

	def number_of_arguments
		if ARGV.length != 3 
			puts "Wrong number of arguments"
			exit
		end
	end

	def grafika a,b,c

		if a!=0 && b!=0 && c!=0

			x2=-(b/(2*a))
            y2=(x2*x2*a)+(x2*b)+c
            x1=x2-14
     	    y1=(x1*x1*a)+(x1*b)+c
            x3=x2+14
            y3=(x3*x3*a)+(x3*b)+c
            @drawer.path x1,y1,x2-x1,(y1-y2)*2,x3-x1,0
        else
        	puts "not a quadratic equal"

	end

end
end