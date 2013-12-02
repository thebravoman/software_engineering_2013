require_relative "drawer.rb"
require_relative "vertex.rb"

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
	
	def add_vertex name
			el = Vertex.new(name)
			self.vs << el
	end	
	
	def add_edge source,target
		edges << [vs[source], vs[target]]
	end
	
	private
	def calculate_positions
		circle_center_x =  120
		circle_center_y =  -100
		angle = Math::PI/vs.size
		r = 400
		vs.each_index do |n|				
			vs[n].x = r * Math.cos(2 * n * angle) + circle_center_x 
			vs[n].y = r * Math.sin(2 * n * angle) + circle_center_y
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
