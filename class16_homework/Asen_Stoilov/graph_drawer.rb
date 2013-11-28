require_relative "drawer"
require_relative "vertex"


d = Drawer.new "graph.svg", 300, 350
d.start

class GraphDrawer
	
	attr_accessor :vs
	attr_accessor :edges
	attr_accessor :r
	attr_accessor :yc
	attr_accessor :xc
	
	def initialize drawer
		@drawer = drawer
		self.vs = []
		self.edges = []
		
	end
	
	def draw
		self.xc = 100
		self.yc = 50
		self.r=(self.vs).length*15
		calculate_positions
		draw_vertexes
		draw_circled
	end	
	
	private
	
	def draw_circled
		
		@drawer.circle xc,yc,r,"none"
	end
	
	def calculate_x n
		case n
		when 0, 2
		vs[n].x=(xc+(r/Math.sqrt(2)))
		when 6, 4
		vs[n].x=(xc-r/Math.sqrt(2))
		when 3, 7
		vs[n].x=xc
		when 5
		vs[n].x=xc-r
		when 1
		vs[n].x=xc+r
		else 
		p "ERROR! can't print more than 8 points"
		end
	end
	
	def calculate_y n
		case n
		when 0, 6
		vs[n].y = (yc-r/Math.sqrt(2))
		when 4, 2
		vs[n].y = (yc+r/Math.sqrt(2))
		when 5, 1
		vs[n].y = yc
		when 3
		vs[n].y = yc + r
		when 7
		vs[n].y = yc - r
		else 
		p "ERROR! can't print more than 8 points"
		end
	end	
	
	def calculate_positions
		vs.each_index do |n|
		calculate_x n
		calculate_y n	
		end
	end
	
	

	def draw_vertexes
		vs.each { |v|	v.draw @drawer }
	end
	
end

graph = GraphDrawer.new d
v1 = Vertex.new("1")
v2 = Vertex.new("2")
v3 = Vertex.new("3")
v4 = Vertex.new("4")
v5 = Vertex.new("5")
v6 = Vertex.new("6")
v7 = Vertex.new("7")
v8 = Vertex.new("8")
graph.vs << v1
graph.vs << v2
graph.vs << v3
graph.vs << v4
graph.vs << v5
graph.vs << v6
graph.vs << v7
graph.vs << v8
graph.edges << [v1,v2]
graph.edges << [v2,v3]
graph.edges << [v3,v4]
graph.edges << [v4,v5]
graph.edges << [v5,v6]
graph.edges << [v6,v7]
graph.edges << [v7,v8]
graph.draw

d.finish
