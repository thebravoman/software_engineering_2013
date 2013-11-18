require 'rexml/document'

class Drawer
	attr_writer :file_name
	attr_reader :file_name
	attr_accessor :x
	attr_accessor :y

	def initialize file_name="result.svg",x,y
		self.file_name=file_name
		self.x=x
		self.y=y
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
		line(150,self.y,450,self.y)
		line(self.x,150,self.x,450)
	end

	def path x1,y1,x2,y2,x3,y3
		p=@el_svg.add_element "path"
		p.attributes["d"]="M #{self.x+x1} #{self.y-y1} q #{x2} #{y2} #{x3} #{y3}"
		p.attributes["fill"]="none"
		p.attributes["stroke"]="blue"
		p.attributes["strike-width"]="2"
	end
end

class MathDrawer
	def initialize d
		@drawer=d
	end

	def parabola a,b,c
		if a!=0
			x2=-(b/(2*a))
			y2=(x2*x2*a)+(x2*b)+c
			x1=x2-12.5
			y1=(x1*x1*a)+(x1*b)+c
			x3=x2+12.5
			y3=(x3*x3*a)+(x3*b)+c
			@drawer.path x1,y1,x2-x1,(y1-y2)*2,x3-x1,0
		else
			puts "That isn't a quadratic equation!"
		end
	end
end

d=Drawer.new "math.svg",300,300
d.start
d.cs

m=MathDrawer.new d

m.parabola ARGV[0].to_i,ARGV[1].to_i,ARGV[2].to_i
d.finish
