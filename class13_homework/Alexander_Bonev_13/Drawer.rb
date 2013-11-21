require 'rexml/document'

class Drawer

	attr_writer :file_name
	attr_reader :file_name

	attr_accessor :x 
	attr_accessor :y

	def initialize file_name="Alexander_Bonev.svg",x,y
		self.file_name = file_name
		self.x=x
		self.y=y

		
	end
	
	def start
		@doc = REXML::Document.new
		@el_svg = @doc.add_element "svg"
		@el_svg.attributes["version"] = "1.1"
		@el_svg.attributes["xmlns"]="http://www.w3.org/2000/svg"
	end

	def finish
		File.open(file_name, "w") do |svg|
			svg << @doc.to_s
		end
	end

	def line x1,y1,x2,y2
		
		l = @el_svg.add_element "line"
		l.attributes["x1"] = x1 + self.x
		l.attributes["x2"] = x2 + self.x
		l.attributes["y1"] = self.y - y1
		l.attributes["y2"] = self.y - y2
		l.attributes["stroke"] = "black"
		l.attributes["stroke-width"] = "2"
		
	end

	def cs_arrows
	 line(240,10, 250, 0)
     line(240,-10,250,0)
     line(0,250,10,240)
     line(0,250,-10,240)
	end

	def lining
		i = -250
                while i < 250
                        line(5,i,-5,i)
                        line(i,5,i,-5)
                        i = i + 20
                end
	end


	def cs
	 line(250,0,-250,0)
     line(0,250,0,-250)
	end	

	 def path x1,y1,x2,y2,x3,y3
                p=@el_svg.add_element "path"
                p.attributes["d"]="M #{self.x+x1} #{self.y-y1} q #{x2} #{y2} #{x3} #{y3}"
                p.attributes["fill"]="none"
                p.attributes["stroke"]="black"
                p.attributes["stroke-width"]="2"
        end
	
end



