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
		sum = 90
		radius = 200
		step = 360 / vs.length
		vs.each_index do |n|
			sum += step
			sum_in_rad = sum *(Math::PI)/ 180
			vs[n].x = radius * (Math.cos(sum_in_rad))
			vs[n].y = radius * (Math.sin(sum_in_rad))
			
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
v1 = Vertex.new("172.16.18.15")
v2 = Vertex.new("172.16.18.10")
v3 = Vertex.new("172.16.18.222")
v4 = Vertex.new("172.16.18.213")
v5 = Vertex.new("172.16.18.175")

graph_drawer.vs << v1
graph_drawer.vs << v2
graph_drawer.vs << v3
graph_drawer.vs << v4
graph_drawer.vs << v5

graph_drawer.connections << [v1,v2]
graph_drawer.connections << [v2,v3]
graph_drawer.connections << [v3,v4]
graph_drawer.connections << [v4,v5]
graph_drawer.connections << [v5,v1]

graph_drawer.draw

d.finish
