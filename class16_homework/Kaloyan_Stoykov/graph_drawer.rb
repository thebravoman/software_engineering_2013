require_relative "drawer"
require_relative "vertex"

d = Drawer.new "Kaloyan_Stoykov.svg", 300, 350
d.start

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
		r = 42
		space_points = (2 * Math::PI) / vs.length
		
		vs.each_index do |n|
			vs[n].x = r * Math.cos(n * space_points)
			vs[n].y = r * Math.sin(n * space_points)	
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

graph = GraphDrawer.new d
v1 = Vertex.new("1")
v2 = Vertex.new("2")
v3 = Vertex.new("3")
v4 = Vertex.new("4")
v5 = Vertex.new("5")
v6 = Vertex.new("6")
v7 = Vertex.new("7")
v8 = Vertex.new("8")
v9 = Vertex.new("9")

graph.vs << v1
graph.vs << v2
graph.vs << v3
graph.vs << v4
graph.vs << v5
graph.vs << v6
graph.vs << v7
graph.vs << v8
graph.vs << v9

graph.draw

d.finish
