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
		l.attributes["x1"]=self.x+x1
		l.attributes["x2"]=self.x+x2
		l.attributes["y1"]=self.y-y1
		l.attributes["y2"]=self.y-y2
		l.attributes["stroke"]="black"
		l.attributes["stroke-width"]="2"
	end

	def rect w,h
		r=@el_svg.add_element "rect"
		r.attributes["width"]=w
		r.attributes["height"]=h
		r.attributes["x"]=self.x
		r.attributes["y"]=self.y-h
		r.attributes["stroke"]="black"
		r.attributes["stroke-width"]="2"
		r.attributes["fill"]="rgb(255,255,0)"
	end

	def circle x,y,r
		c=@el_svg.add_element "circle"
		c.attributes["cx"]=self.x+x
		c.attributes["cy"]=self.y-y
		c.attributes["r"]=r
		c.attributes["stroke"]="black"
		c.attributes["stroke-width"]="2"
		c.attributes["fill"]="rgb(0,0,255)"
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
		line(-200,0,200,0)
		line(0,-200,0,200)
	end

	def path x1,y1,x2,y2,x3,y3
		p=@el_svg.add_element "path"
		p.attributes["d"]="M #{self.x+x1} #{self.y-y1} q #{x2} #{y2} #{x3} #{y3}"
		p.attributes["fill"]="none"
		p.attributes["stroke"]="blue"
		p.attributes["strike-width"]="2"
	end

	def text value,x,y
		t=@el_svg.add_element "text"
		t.text=value
		t.attributes["x"]=self.x+x
		t.attributes["y"]=self.y-y
	end
end
