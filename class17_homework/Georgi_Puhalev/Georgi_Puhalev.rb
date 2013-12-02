require_relative "drawer"
require_relative "vertex"
require_relative "csv_to_graph"

d = Drawer.new "Georgi_Puhalev.svg", 300, 350
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
		part = (2*Math::PI)/vs.count
		#puts part
		vs.each_index do |n|
			angle = n*part
			vs[n].x = (Math.cos(angle))*8*vs.count
			vs[n].y = (Math.sin(angle))*8*vs.count
#			puts n*part
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
		vs.each { |v|	v.draw @drawer}
	end
	
end



graph_drawer = GraphDrawer.new d

c = CSVtoGRAPH.new 
c.parser

graph_drawer.vs = c.get_vertex
graph_drawer.edges = c.edges_catchemall

graph_drawer.draw









=begin
graph = GraphDrawer.new d
v1 = Vertex.new("172.16.18.14")
v2 = Vertex.new("172.16.18.10")
v3 = Vertex.new("172.16.18.5")
v4 = Vertex.new("172.16.18.14")
v5 = Vertex.new("172.16.18.10")
v6 = Vertex.new("172.16.18.5")
v7 = Vertex.new("172.16.18.14")
v8 = Vertex.new("172.16.18.10")
#v9 = Vertex.new("172.16.18.5")
graph.vs << v1
graph.vs << v2
graph.vs << v3
graph.vs << v4
graph.vs << v5
graph.vs << v6
graph.vs << v7
graph.vs << v8
#graph.vs << v9
graph.edges << [v1,v2]
graph.edges << [v2,v3]
graph.edges << [v3,v4]
graph.edges << [v4,v5]
graph.edges << [v5,v6]
graph.edges << [v6,v7]
graph.edges << [v7,v8]
#graph.edges << [v8,v9]
graph.draw
=end


d.finish
