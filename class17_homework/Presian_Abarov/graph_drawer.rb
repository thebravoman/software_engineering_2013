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
		draw_vertexes
		draw_edges
	end	

	def calculate_positions
		vs.each_index do |n|
			vs[n].x = n*128
			vs[n].y = 0;
		end
	end

	def draw_edges
		edges.each do |vertexes|
			x1 = vertexes[0].x
			x2 = vertexes[1].x
			color = "#" + "%06x" % (rand * 0xffffff)
			@drawer.path x1, x2, (x2-x1)/2, color
		end
	end

	def draw_vertexes
		vs.each { |v|	v.draw @drawer }
	end
end