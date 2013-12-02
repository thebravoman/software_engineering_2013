require_relative "vertex"
require_relative "drawer"

class GraphDrawer
	
	attr_accessor :vs
	attr_accessor :connections
	
	def initialize drawer
		@drawer = drawer
		self.vs = []
		self.connections = []
	end
	
	def draw
		calculate_positions
		draw_vertexes
		draw_connections
	end
	
	private 
	def calculate_positions
		vs.each_index do |n|
			if n.odd?
				vs[n].x = -(15+15*n)
				vs[n].y = 15+15*n
			else
				vs[n].x = 15+15*n
				vs[n].y = 15+15*n
			end
		end
	end
	
	def draw_vertexes
		vs.each_index do |n|
			vs[n].draw @drawer
		end
	end
	
	def draw_connections
		connections.each do |conn|
			v1 = conn[0]
			v2 = conn[1]
			x1 = v1.x + 10
			y1 = v1.y + 10
			x2 = v2.x + 10
			y2 = v2.y + 10
			@drawer.line x1,y1,x2,y2
		end 
	end
	
end
