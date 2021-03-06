require_relative "vertex"
require_relative "drawer"
require_relative "csv_to_graph"

d = Drawer.new "Alexander_Iliev.svg", 300,350
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
			x1 = conn[0].x + 10
			y1 = conn[0].y + 10
			x2 = conn[1].x + 10
			y2 = conn[1].y + 10
			@drawer.line x1,y1,x2,y2
		end 
	end
	
end


graph_drawer = GraphDrawer.new d
#graph_drawer.connections << [v1,v2]

c = CsvParser.new 
c.read

graph_drawer.vs = c.get_vertex
graph_drawer.connections = c.get_edges



#1 - [3,7,4,1,3,3]
#2 - [[3,7]	,[4,1],[3,3]]
#3 - 	[v1, [v2,v3,v4]]
#			[v3, [v1,v4]]

graph_drawer.draw

d.finish
