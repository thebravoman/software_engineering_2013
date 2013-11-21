require_relative "vertex"
require_relative "drawer"

d = Drawer.new "graph.svg", 300,350
d.start

class GraphDrawer
	
	attr_accessor :vs
	
	def initialize drawer
		@drawer = drawer
		self.vs = []
	end
	
	def draw
		vs.each_index do |n|
			x = 50+50*n
			y = 50+50*n
			vs[n].draw @drawer, x, y
		end
	end
end

graph_drawer = GraphDrawer.new d
v1 = Vertex.new("172.16.18.15")
graph_drawer.vs << v1
v2 = Vertex.new("172.16.18.10")
graph_drawer.vs << v2
graph_drawer.vs << Vertex.new("172.16.18.5")

#1 - [3,7,4,1,3,3]
#2 - [[3,7],[4,1],[3,3]]
#3 - 	[v1, [v2,v3,v4]]
#			[v3, [v1,v4]]

v1 -> v2

graph_drawer.draw

d.finish
