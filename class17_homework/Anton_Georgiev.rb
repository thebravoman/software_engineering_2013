require_relative 'Anton_Georgiev/drawer'
require_relative 'Anton_Georgiev/vertex'
require_relative 'Anton_Georgiev/csv_graph'

d = Drawer.new "Anton_Georgiev.svg", 300, 300
d.start

class GraphDrawer
	
	attr_accessor :vs
	attr_accessor :edges
	attr_accessor :p
	
	def initialize drawer
		@drawer = drawer
		self.vs = []
		self.edges = []
		self.p=2*Math::PI
	end
	
	def draw
		calculate_positions
		draw_vertexes
		draw_edges
	end
	
	private
	def sin_cos deg,check
		if check=="cos"
			return Math.cos(self.p/(360/deg))*150
		elsif check=="sin"
			return Math.sin(self.p/(360/deg))*150
		end
	end
	def calculate_positions
		if vs.size==1
			vs[0].x = 0
			vs[0].y = 0
		else
			degrees=360/vs.size
			vs.each_index do |n|
				if (n+1)*degrees>90 && (n+1)*degrees<180
					deg=180-(n+1)*degrees
					vs[n].x = -sin_cos(deg,"cos")
					vs[n].y = sin_cos(deg,"sin")
				elsif (n+1)*degrees>180 && (n+1)*degrees<=270
					if (n+1)*degrees!=270
						deg=270-(n+1)*degrees
					else deg=270
					end
					vs[n].x = -sin_cos(deg,"sin")
					vs[n].y = -sin_cos(deg,"cos")
				elsif (n+1)*degrees>270 && (n+1)*degrees<360
					deg=360-(n+1)*degrees
					vs[n].x = sin_cos(deg,"cos")
					vs[n].y = -sin_cos(deg,"sin")
				else
					deg=(n+1)*degrees
					vs[n].x = sin_cos(deg,"cos")
					vs[n].y = sin_cos(deg,"sin")
				end
			end
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
v=CSV_to_graph.new ARGV[0]
graph.vs=v.create_vs
graph.edges=v.create_edges
graph.draw

d.finish
