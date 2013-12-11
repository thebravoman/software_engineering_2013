require "drawer"

class Vertex
	
	attr_accessor :name
	attr_accessor :x
	attr_accessor :y
	
	def initialize name
		self.name = name
	end
	
	def draw drawer
		drawer.circle self.x,self.y,40
		drawer.text name, self.x+40,self.y+40
	end
end
