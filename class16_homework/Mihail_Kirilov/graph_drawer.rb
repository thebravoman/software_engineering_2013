require_relative "vertex"
require_relative "drawer"

d = Drawer.new "graph.svg", 300,350
d.start

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
		vs_length = vs.length
		
		inc = (2*Math::PI)/vs.length
		angle = 90 - 2*inc
		p Math::PI
		p Math::PI*2
		p vs.length
		p inc

		radius = 200 
		vs.each_index do |n|
			vs[n].x = 100*Math.cos(angle)
			vs[n].y = 100*Math.sin(angle)
			angle -= inc
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

graph_drawer = GraphDrawer.new d
v1 = Vertex.new("1")
graph_drawer.vs << v1
v2 = Vertex.new("2")
graph_drawer.vs << v2
v3 = Vertex.new("3")
graph_drawer.vs << v3
v4 = Vertex.new("4")
graph_drawer.vs << v4
v5 = Vertex.new("5")
graph_drawer.vs << v5
v6 = Vertex.new("6")
graph_drawer.vs << v6
v7 = Vertex.new("7")
graph_drawer.vs << v7
v8 = Vertex.new("8")
graph_drawer.vs << v8
v9 = Vertex.new("9")
graph_drawer.vs << v9
v10 = Vertex.new("10")
graph_drawer.vs << v10
v11 = Vertex.new("11")
graph_drawer.vs << v11
v12 = Vertex.new("12")
graph_drawer.vs << v12

#graph_drawer.connections << [v1,v2]


#1 - [3,7,4,1,3,3]
#2 - [[3,7],[4,1],[3,3]]
#3 - 	[v1, [v2,v3,v4]]
#			[v3, [v1,v4]]

graph_drawer.draw

d.finish
