require "rexml/document"

class Drawer

	attr_writer :file_name
	attr_reader :file_name
	
	attr_accessor :x
	attr_accessor :y
	
	def initialize file_name="result.svg",x=200,y=200
		self.file_name = file_name
		self.x = x
		self.y = y
		set_fill
	end
	
	def set_fill color="black"
	        @fill_color = color
	end
	
	def rect w,h,x,y
		r= @el_svg.add_element "rect"
		r.attributes["width"] = w
		r.attributes["height"] = h
		r.attributes["x"] = self.x + x
		r.attributes["y"] = self.y - y - h
		r.attributes["stroke"] = "black"
		r.attributes["stroke-width"] = "2"
		r.attributes["fill"] = @fill_color
		set_fill
	end
	
	def circle x,y,r
		c = @el_svg.add_element "circle"
		c.attributes["cx"] = self.x + x
		c.attributes["cy"] = self.y - y
		c.attributes["r"] = r
		c.attributes["stroke"] = "black"
		c.attributes["stroke-width"] = "2"
		c.attributes["fill"] = @fill_color
		set_fill
	end
	
	def start
                @doc = REXML::Document.new
                @el_svg = @doc.add_element "svg"
                @el_svg.attributes["version"] = "1.1"
                @el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
	end
	
	def line x1,y1,x2,y2
                l = @el_svg.add_element "line"
                l.attributes["x1"] = x1+self.x
                l.attributes["x2"] = x2+self.x
                l.attributes["y1"] = self.y - y1
                l.attributes["y2"] = self.y - y2
                l.attributes["style"] = "stroke:#{@fill_color};stroke-width:2"
                set_fill
	end
	
	def cs
	        set_fill
		line(0,200,0,-200)
		line(200,0,-200,0)
	end

	def text value, x, y
		t = @el_svg.add_element "text"
		t.attributes["x"] = x + self.x
		t.attributes["y"] = self.y - y
		t.text = value
	end
	
	def point x,y
		circle x,y,5
	end
	
	def path x1,y1,mid_x,mid_y,x2,y2
	        l = @el_svg.add_element "path"
	        l.attributes["d"] = "M #{self.x + x1} #{self.y - y1}  q #{mid_x - x1} #{-mid_y - y1} #{x2-x1} #{-y2-y1}" 
	        l.attributes["stroke"]="blue" 
	        l.attributes["stroke-width"] ="5" 
	        l.attributes["fill"] = "none" 
	end
	def finish
		File.open(self.file_name, "w") do |f|
			f.write(@doc.to_s)
		end
	end
	
end
