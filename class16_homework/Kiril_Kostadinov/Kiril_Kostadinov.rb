require_relative "drawer"
require_relative "vertex"

d = Drawer.new "Kiril_Kostadinov.svg", 300, 350
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
			angle += inc
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

graph = GraphDrawer.new d
v1 = Vertex.new("172.16.18.14")
v2 = Vertex.new("172.16.18.10")
v3 = Vertex.new("172.16.18.5")
v4 = Vertex.new("172.16.18.20")
v5 = Vertex.new("172.16.18.18")
v6 = Vertex.new("172.16.18.13")
v7 = Vertex.new("172.16.18.10")
v8 = Vertex.new("172.16.18.6")
graph.vs << v1
graph.vs << v2
graph.vs << v3
graph.vs << v4
graph.vs << v5
graph.vs << v6
graph.vs << v7
graph.vs << v8
#random edges
graph.edges << [v1,v2]
graph.edges << [v1,v3]
graph.edges << [v1,v6]
graph.edges << [v2,v3]
graph.edges << [v2,v4]
graph.edges << [v2,v6]
graph.edges << [v3,v5]
graph.edges << [v3,v7]
graph.edges << [v4,v6]
graph.edges << [v4,v7]
graph.edges << [v4,v5]
graph.edges << [v5,v7]
graph.edges << [v6,v7]
graph.edges << [v6,v5]
graph.edges << [v7,v2]
graph.edges << [v8,v6]
graph.edges << [v8,v7]
graph.edges << [v8,v1]
graph.draw

d.finish
