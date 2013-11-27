require_relative "drawer"
require_relative "vertex"


require "mathn"
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
	def calculate_positions
		count = vs.count
		radius = count * 25
		radius = 300 if radius > 300
		vs.each_index do |n|
			rads = 6.28 * (n / count)
			vs[n].x = Math.cos(rads) * radius
			vs[n].y = Math.sin(rads) * radius
		end
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

