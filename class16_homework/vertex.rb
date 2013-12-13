require_relative "drawer"

class Vertex
	
	attr_accessor :name
	attr_accessor :x
	attr_accessor :y
	
	def initialize name
		self.name = name
	end
	
	def draw drawer
		drawer.rect 20, 20, self.x, self.y
		drawer.text name, self.x+20, self.y+20
	end
end
