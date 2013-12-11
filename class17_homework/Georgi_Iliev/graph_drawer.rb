require_relative "vertex"
require_relative "drawer"
require_relative "csv_graph"

d = Drawer.new "Georgi_Iliev.svg", 600,350
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
		step = (Math::PI*2.0)/vs.size
		curr = 0
		vs.each_index do |n|
			vs[n].x = Math.cos(curr)*200
			vs[n].y = Math.sin(curr)*200
			curr += step
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
