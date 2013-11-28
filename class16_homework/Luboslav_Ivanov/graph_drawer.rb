require_relative 'vertex'
require_relative 'drawer'
require_relative 'edge'

d = Drawer.new "Luboslav_Ivanov.svg",600,350
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
		angle = (3.14*2)/vs.length # 
		p angle
		r =vs.length*15
		vs.each_index do |n|
				vs[n].x = Math.cos(angle*n)*r 
				vs[n].y = Math.sin(angle*n)*r

		end	

#			vs[1].x = Math.cos(edge*1)*r 
#			vs[1].y = Math.sin(edge*1)*r
#			vs[2].x = Math.cos(edge*2)*r 
#			vs[2].y = Math.sin(edge*2)*r
#			vs[3].x = Math.cos(edge*3)*r 
#			vs[3].y = Math.sin(edge*3)*r
#			vs[4].x = Math.cos(edge*4)*r 
#			vs[4].y = Math.sin(edge*4)*r
#			vs[5].x = Math.cos(edge*5)*r 
#			vs[5].y = Math.sin(edge*5)*r
#			vs[6].x = Math.cos(edge*6)*r
#			vs[6].y = Math.sin(edge*6)*r
#			vs[7].x = Math.cos(edge*7)*r
#			vs[7].y = Math.sin(edge*7)*r
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
