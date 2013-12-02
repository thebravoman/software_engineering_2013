require "drawer"
require "vertex"

<<<<<<< HEAD
d = Drawer.new "graph.svg", 300, 350
=======
d = Drawer.new "Bogomil_Kolarov.svg", 300, 350
>>>>>>> a46ce92c36dfb632d0e4c1182ebe371968fea8da
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
		draw_vertexes
		draw_edges
	end	
	
	private
	def calculate_positions
		vs.each_index do |n|
			vs[n].x = (Math.cos((2*Math::PI/vs.count)*n))*(vs.count*10)
			vs[n].y = (Math.sin((2*Math::PI/vs.count)*n))*(vs.count*10)
		end
	end
	
	def draw_edges
		edges.each do |vertexes|
			x1 = vertexes[0].x
			y1 = vertexes[0].y
			x2 = vertexes[1].x
			y2 = vertexes[1].y
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
v4 = Vertex.new("172.16.18.15")
v5 = Vertex.new("172.16.18.16")
v6 = Vertex.new("172.16.18.17")
v7 = Vertex.new("172.16.18.18")
v8 = Vertex.new("172.16.18.19")
v9 = Vertex.new("172.16.18.20")
v10 = Vertex.new("172.16.18.188")
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
graph.edges << [v1,v2]
graph.edges << [v2,v3]
graph.edges << [v3,v4]
graph.edges << [v4,v5]
graph.edges << [v5,v6]
graph.edges << [v6,v7]
graph.edges << [v7,v8]
graph.edges << [v8,v9]
graph.edges << [v9,v10]
graph.edges << [v10,v1]
graph.draw

d.finish
