class Edge
	
	attr_accessor :source
	attr_accessor :target

	def initialize v1, v2
		source = v1
		v1.edges << self		
		target = v2
		v2.edges << self
	end

#example1
	def draw d, x1,x2,y1,y2
		d.line(x1,y1,x2,y2)
	end
end
