class Vertex
	attr_accessor :name
	
	def initialize name
		self.name = name 
	end
	def draw d, x, y
		d.circle x,y,5
		d.text name,x+10,y+10
	end
	
end
