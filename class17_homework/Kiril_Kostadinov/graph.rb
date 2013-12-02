require_relative "drawer"
require_relative "vertex"

class GraphDrawer
	
	attr_accessor :vs
	attr_accessor :edges
	
	def initialize drawer
		@drawer = drawer
		self.vs = []
		self.edges = []
	end
	
	def draw
		calculate_positions
		draw_edges
		draw_vertexes
	end	
	
	private
	def calculate_positions
		angle = 0
		inc = (2*Math::PI)/vs.length
		radius = 200 
		vs.each_index do |n|
			vs[n].x = radius*Math.cos(angle)
			vs[n].y = radius*Math.sin(angle)
			angle -= inc
		end
	end
	
	def draw_edges
		edges.each do |vertexes|
			x1 = vertexes[0].x + 10
			y1 = vertexes[0].y + 10
			x2 = vertexes[1].x + 10
			y2 = vertexes[1].y + 10
			@drawer.line x1,y1,x2,y2
		end
	end

	def draw_vertexes
		vs.each { |v|	v.draw @drawer }
	end
	
end
