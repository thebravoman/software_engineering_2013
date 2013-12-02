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
	
	def add_vertex name
			el = Vertex.new(name)
			name = name.split(".")[0..3]
			el.colour = "rgb(#{name[0]},#{name[1]},#{name[2]})"
			self.vs << el
	end	
	
	def add_edge source,target
		edges << [vs[source], vs[target]]
	end
	
	private
	def calculate_positions
		step = (Math::PI*2.0)/vs.size
		curr = 0
		vs.each_index do |n|
			vs[n].x = Math.cos(curr)*300
			vs[n].y = Math.sin(curr)*300
			curr += step
		end
	end
	
	def draw_edges
		edges.each do |vertexes|
			x1 = vertexes[0].x
			y1 = vertexes[0].y
			x2 = vertexes[1].x
			y2 = vertexes[1].y
			@drawer.set_fill vertexes[0].colour
			@drawer.line x1,y1,x2,y2
		end
	end

	def draw_vertexes
		vs.each do |v|	
			@drawer.set_fill v.colour
			v.draw @drawer
		end
	end
	
end

