class Vertex

	attr_accessor :name
	attr_accessor :x
	attr_accessor :y
	
	def initialize name
		self.name = name 
	end

	def draw d
		d.circle self.x,self.y,5
		d.text name,self.x+5,self.y+5
	end
	
end
