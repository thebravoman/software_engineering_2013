require_relative "drawer"
require_relative "vertex"

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

	def calculate_positions
		vs.each_index do |n|
			if n != 0 
				vs[n].x = n*10*vs[n-1].name.length
			else 
				vs[n].x = n*10
			end
			vs[n].y = 0;
		end
	end

	def draw_edges
		edges.each do |vertexes|
			x1 = vertexes[0].x
			x2 = vertexes[1].x
			color = "#" + "%06x" % (rand * 0xffffff)
			@drawer.path x1, x2, (x1+x2)/2, color
		end
	end

	def draw_vertexes
		vs.each { |v|	v.draw @drawer }
	end
	
end
d = Drawer.new "Presian_Abarov.svg"
d.start
graph = GraphDrawer.new d
v1 = Vertex.new("172.16.18.13")
v10 = Vertex.new("172.16.18.14")
v11 = Vertex.new("172.16.18.15")

graph.vs << v1
graph.vs << v11
graph.vs << v10
graph.edges << [v10,v1]

graph.edges << [v11,v1]
graph.draw



d.finish