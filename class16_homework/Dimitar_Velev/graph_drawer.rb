require "vertex"
require "drawer"

d = Drawer.new "Dimitar_Velev.svg", 300,350
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
		spacing = (2*Math::PI)/vs.length
                radius = 215
                vs.each_index do |n|
                        vs[n].x = radius*Math.cos(n*spacing)
                        vs[n].y = radius*Math.sin(n*spacing)
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
v10 = Vertex.new("")
graph_drawer.vs << v10
v11 = Vertex.new("")
graph_drawer.vs << v11
v12 = Vertex.new("")
graph_drawer.vs << v12
graph_drawer.connections << [v1,v2]
graph_drawer.connections << [v2,v3]
graph_drawer.connections << [v3,v4]
graph_drawer.connections << [v4,v5]
graph_drawer.connections << [v5,v6]
graph_drawer.connections << [v6,v7]
graph_drawer.connections << [v7,v8]
graph_drawer.connections << [v8,v9]
graph_drawer.connections << [v9,v10]
graph_drawer.connections << [v10,v11]
graph_drawer.connections << [v11,v12]
graph_drawer.connections << [v12,v1]

graph_drawer.draw

d.finish
