require_relative "drawer"
require_relative "vertex"

d = Drawer.new "graph.svg", 300, 350
d.start

class GraphDrawer
	
	attr_accessor :vs
	def initialize drawer
		@drawer = drawer
		self.vs = []
	end
	
	def draw
		vs.each do |v|
			v.draw @drawer, 100, 100
		end
	end	
end

graph = GraphDrawer.new d
graph.vs << Vertex.new "172.16.18.14"
graph.vs << Vertex.new "172.16.18.10"
graph.draw

d.finish
