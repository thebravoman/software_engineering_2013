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
	
	private
	def circle_alignment
		r = vs.length * 10
		stepX = 4.0 * r / vs.length
		x = -r + 1.0
		vs.each_index do |n|
			y = Math.sqrt( r*r - x*x )
			y = -y if n.odd?
			vs[n].x = x
			vs[n].y = y
			x += stepX if n.odd? or y.zero?
		end
	end

	def calculate_positions
		circle_alignment
	end
	
	def draw_edges
		edges.each do |vertexes|
			x1 = vertexes[0].x
			y1 = vertexes[0].y
			x2 = vertexes[1].x
			y2 = vertexes[1].y
			@drawer.line x1,y1,x2,y2
		end
	end

	def draw_vertexes
		vs.each { |v|	v.draw @drawer }
	end
	
end
