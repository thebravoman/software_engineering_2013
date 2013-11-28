require_relative "vertex"
require_relative "drawer"

d = Drawer.new "graph.svg", 300,350
d.start

class Numeric
  def degrees
    self * Math::PI / 180
  end
end

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
		inc = (360/vs.length).degrees
		angle =90 - 2*inc
		vs.each_index do |n|
			vs[n].x = 150*Math.cos(angle)
			vs[n].y = 150*Math.sin(angle)
			angle -= inc
		end
		@drawer.line 0,0,vs[-1].x,vs[-1].y-15
		@drawer.line 0,0,vs[0].x,vs[0].y
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
v1 = Vertex.new("1 - The")
graph_drawer.vs << v1
v2 = Vertex.new("2 - clock")
graph_drawer.vs << v2
v3 = Vertex.new("3 - shows")
graph_drawer.vs << v3
v4 = Vertex.new("4 - the")
graph_drawer.vs << v4
v5 = Vertex.new("5 - time")
graph_drawer.vs << v5
v6 = Vertex.new("6 - when")
graph_drawer.vs << v6
v7 = Vertex.new("7 - I")
graph_drawer.vs << v7
v8 = Vertex.new("8 - solved")
graph_drawer.vs << v8
v9 = Vertex.new("9 - the")
graph_drawer.vs << v9
v10 = Vertex.new("10 - problem!")
graph_drawer.vs << v10
v11 = Vertex.new("11")
graph_drawer.vs << v11
v12 = Vertex.new("12 - Gimmie' a Break.")
graph_drawer.vs << v12

#graph_drawer.connections << [v1,v2]


#1 - [3,7,4,1,3,3]
#2 - [[3,7],[4,1],[3,3]]
#3 - 	[v1, [v2,v3,v4]]
#			[v3, [v1,v4]]

graph_drawer.draw

d.finish
