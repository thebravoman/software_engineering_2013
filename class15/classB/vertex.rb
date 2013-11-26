require_relative "drawer"

class Vertex
	
	attr_accessor :name
	
	def initialize name
		self.name = name
	end

	def draw drawer, x, y
		drawer.rect 20,20,x,y
		drawer.text name, x+20,y+20
	end
end
