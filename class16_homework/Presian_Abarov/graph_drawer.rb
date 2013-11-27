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

graph = GraphDrawer.new d
v1 = Vertex.new("172.16.18.13")
v2 = Vertex.new("172.16.18.11")
v3 = Vertex.new("172.16.18.54")
v4 = Vertex.new("172.16.18.44")
v5 = Vertex.new("172.16.18.43")
v6 = Vertex.new("172.16.18.88")
v7 = Vertex.new("172.16.18.83")
v8 = Vertex.new("172.16.18.255")
v9 = Vertex.new("172.16.18.1")
v10 = Vertex.new("172.16.18.60")
graph.vs << v1
graph.vs << v2
graph.vs << v3
graph.vs << v4
graph.vs << v5
graph.vs << v6
graph.vs << v7
graph.vs << v8
graph.vs << v9
graph.vs << v10
graph.edges << [v1,v2]
graph.edges << [v2,v3]
graph.edges << [v3,v4]
graph.edges << [v4,v5]
graph.edges << [v5,v6]
graph.edges << [v6,v7]
graph.edges << [v7,v8]
graph.edges << [v8,v9]
graph.edges << [v9,v10]
graph.edges << [v10,v1]
graph.draw

d.finish