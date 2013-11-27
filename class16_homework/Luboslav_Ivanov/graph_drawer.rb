require_relative 'vertex'
require_relative 'drawer'
require_relative 'edge'

d = Drawer.new "graph.svg",300,350
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
#		vs.each_index do |n|
#			if n.even?
#				vs[n].x = 50 +50*n 
#				vs[n].y = 50 +50*n
#			else
#				if n > vs.length/2
#					vs[n].x = 70 +50*n 
#					vs[n].y = 50 +50*n
#				else					
#					vs[n].x = 50 +50*n 
#					vs[n].y = 40 +50*n
#				end
#			end
#		end	
				vs[0].x = 110  #192.168.0.1 middle left
				vs[0].y = 50
				
				vs[1].x = 150 #192.168.0.100 top-semi-middle left 
				vs[1].y = 150	
				
				vs[2].x = 250 #192.168.0.101 top
				vs[2].y = 190	
				
				vs[3].x = 350 #192.168.0.102 top-semi-middle right
				vs[3].y = 150	
				
				vs[4].x = 390 #192.168.0.103 middle right
				vs[4].y = 50	
			
				vs[5].x = 350 #192.168.0.104 Bottom-semi-middle right
				vs[5].y = -50
				
				vs[6].x = 250 #192.168.0.105 Bottom
				vs[6].y = -90		
				
				vs[7].x = 150 #192.168.0.106 Bottom-semi-middle left 
				vs[7].y = -50



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
v1 =  Vertex.new("192.168.0.1")
v2 = Vertex.new("192.168.0.100")
v3 = Vertex.new("192.168.0.101")
v4 = Vertex.new("192.168.0.102")
v5 = Vertex.new("192.168.0.103")
v6 = Vertex.new("192.168.0.104")
v7 = Vertex.new("192.168.0.105")
v8 = Vertex.new("192.168.0.106")


graph_drawer.vs << v1
graph_drawer.vs << v2
graph_drawer.vs << v3
graph_drawer.vs << v4
graph_drawer.vs << v5
graph_drawer.vs << v6
graph_drawer.vs << v7
graph_drawer.vs << v8

graph_drawer.connections << [v1,v2]
graph_drawer.connections << [v2,v3]
graph_drawer.connections << [v3,v4]
graph_drawer.connections << [v4,v5]
graph_drawer.connections << [v5,v6]
graph_drawer.connections << [v6,v7]
graph_drawer.connections << [v7,v8]
graph_drawer.connections << [v8,v1]
graph_drawer.draw

d.finish
