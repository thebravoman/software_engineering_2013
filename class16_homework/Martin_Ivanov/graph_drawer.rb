require_relative "vertex"
require_relative "drawer"

d = Drawer.new "Martin_Ivanov.svg", 300,350
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
		@drawer.circle 10,10, 40
		draw_connections
		draw_vertexes
	end
	
	private 
	def calculate_positions
	    inc = (2*Math::PI)/vs.length
        radius = 200
        
        vs.each_index do |n|
        	vs[n].x = radius*Math.cos(n * inc)
        	vs[n].y = radius*Math.sin(n * inc)
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

graph = GraphDrawer.new d

v1 = Vertex.new("")
v2 = Vertex.new("")
v3 = Vertex.new("")
v4 = Vertex.new("")
v5 = Vertex.new("")
v6 = Vertex.new("")
v7 = Vertex.new("")
v8 = Vertex.new("")
v9 = Vertex.new("")
v10 = Vertex.new("")
v11 = Vertex.new("")
v12 = Vertex.new("")
v13 = Vertex.new("")
v14 = Vertex.new("")
v15 = Vertex.new("")
v16 = Vertex.new("")
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

graph.connections << [v1,v9]
graph.connections << [v5,v13]
graph.connections << [v1,v2]
graph.connections << [v2,v3]
graph.connections << [v3,v4]
graph.connections << [v4,v5]
graph.connections << [v5,v6]
graph.connections << [v6,v7]
graph.connections << [v7,v8]
graph.connections << [v8,v9]
graph.connections << [v9,v10]
graph.connections << [v10,v11]
graph.connections << [v11,v12]
graph.connections << [v12,v13]
graph.connections << [v13,v14]
graph.connections << [v14,v15]
graph.connections << [v15,v16]
graph.connections << [v16,v1]

graph.draw

d.finish
