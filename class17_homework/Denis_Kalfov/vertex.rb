require_relative "drawer"

class Vertex
	
	attr_accessor :name
	attr_accessor :x
	attr_accessor :y

	def initialize name
                self.name = name
        end

	def draw drawer
		drawer.circle_orange self.x,self.y,6
		drawer.text name, self.x+10,self.y+10
	end

end
