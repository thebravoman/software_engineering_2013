require 'rexml/document'

class QuadraticEq
	attr_writer :file_name
	attr_reader :file_name
	attr_accessor :x
	attr_accessor :y

	def initialize file_name="result.svg",x=683,y=384
		self.file_name=file_name
		self.x=x
		self.y=y
		self.start
		self.cs
		self.parabola ARGV[0].to_i,ARGV[1].to_i,ARGV[2].to_i
		self.finish
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
		@doc=REXML::Document.new
		@el_svg=@doc.add_element "svg"
		@el_svg.attributes["version"]="1.1"
		@el_svg.attributes["xmlns"]="http://www.w3.org/2000/svg"
	end

	def finish
		File.open(self.file_name,"w") do |svg|
			svg.write(@doc.to_s)
		end
	end

	def cs
		line(0,self.y,1366,self.y)
		line(self.x,0,self.x,768)
	end

	def path x1,y1,x3,y3,x2,y2
		p=@el_svg.add_element "path"
		p.attributes["d"]="M #{x1} #{y1} Q #{x3} #{y3} #{x2} #{y2}"
		p.attributes["fill"]="none"
		p.attributes["stroke"]="red"
		p.attributes["stroke-width"]="1"
	end
	
	def parabola a,b,c
		if a!=0
			xv = -b / ( 2.0 * a )
			yv = a*xv*xv + b*xv + c
			
			x1 = xv - 8.5
			y1 = a*x1*x1 + b*x1 + c 
			x2 = xv + 8.5
			y2 = a*x2*x2 + b*x2 + c
			x3 = 2.0 * xv - ( x1 + x2 ) / 2.0
			y3 = 2.0 * yv - ( y1 + y2 ) / 2.0
			x1 += 683
			x2 += 683
			x3 += 683
			y1 = -y1 + 384
			y2 = -y2 + 384
			y3 = -y3 + 384
			
			path x1,y1,x3,y3,x2,y2
		else
			puts "This isn't a quadratic equation!"
		end
	end
end

QuadraticEq.new
