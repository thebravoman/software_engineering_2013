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
		if vs.size == 1
			vs[0].x = 0
			vs[0].y = 0
		else
			degree = 360/vs.size
			r = vs.size*6
			vs.each_index do |n|
				vs[n].x = Math.sin((degree*n)*3.14 / 180)*r - 10
				vs[n].y = Math.cos((degree*n)*3.14 / 180)*r - 10
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

graph_drawer = GraphDrawer.new d
v1 = Vertex.new("")
graph_drawer.vs << v1
v2 = Vertex.new("")
graph_drawer.vs << v2
v3 = Vertex.new("")
graph_drawer.vs << v3
v4 = Vertex.new("")
graph_drawer.vs << v4
v5 = Vertex.new("")
graph_drawer.vs << v5
v6 = Vertex.new("")
graph_drawer.vs << v6
v7 = Vertex.new("")
graph_drawer.vs << v7
v8 = Vertex.new("")
graph_drawer.vs << v8
v9 = Vertex.new("")
graph_drawer.vs << v9



graph_drawer.connections << [v1,v2]
graph_drawer.connections << [v2,v3]
graph_drawer.connections << [v3,v4]
graph_drawer.connections << [v4,v5]
graph_drawer.connections << [v6,v5]
graph_drawer.connections << [v6,v7]
graph_drawer.connections << [v7,v8]
graph_drawer.connections << [v8,v9]
graph_drawer.connections << [v1,v9]


#1 - [3,7,4,1,3,3]
#2 - [[3,7],[4,1],[3,3]]
#3 - 	[v1, [v2,v3,v4]]
#			[v3, [v1,v4]]

graph_drawer.draw

d.finish
