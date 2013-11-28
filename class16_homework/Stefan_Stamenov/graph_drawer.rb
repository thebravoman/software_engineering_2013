require"drawer"
require"vertex"

d = Drawer.new "Stefan_Stamenov.svg", 550, 350
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
		space = (2*Math::PI)/vs.length
		radius = 250 
		vs.each_index do |n|
			vs[n].x = radius*Math.cos(n*space)
			vs[n].y = radius*Math.sin(n*space)
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
v1 = Vertex.new("93.155.151.1")
v2 = Vertex.new("93.155.151.2")
v3 = Vertex.new("93.155.151.3")
v4 = Vertex.new("93.155.151.4")
v5 = Vertex.new("93.155.151.5")
v6 = Vertex.new("93.155.151.6")
v7 = Vertex.new("93.155.151.7")
v8 = Vertex.new("93.155.151.8")
v9 = Vertex.new("93.155.151.9")
v10 = Vertex.new("93.155.151.10")
v11 = Vertex.new("93.155.151.11")
v12 = Vertex.new("93.155.151.12")
v13 = Vertex.new("93.155.151.13")
v14 = Vertex.new("93.155.151.14")
v15 = Vertex.new("93.155.151.15")
v16 = Vertex.new("93.155.151.16")
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
graph.vs << v11
graph.vs << v12
graph.vs << v13
graph.vs << v14
graph.vs << v15
graph.vs << v16

graph.edges << [v5,v11]
graph.edges << [v11,v2]
graph.edges << [v2,v8]
graph.edges << [v8,v15]
graph.edges << [v15,v5]
graph.draw

d.finish
