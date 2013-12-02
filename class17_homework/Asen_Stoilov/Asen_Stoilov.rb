require_relative "drawer"
require_relative "vertex"
require_relative "CsvDrawer"

d = Drawer.new "Asen_Stoilov.svg", 300, 350
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
		draw_edges
		
	end	
	
	private
	

	
	def calculate_positions
		vs.each_index do |n|
		if n.odd? 
			vs[n].x = 50 +n*50
			vs[n].y = 200	
		else
			vs[n].x = 50 +(n-1)*50
			vs[n].y = 100	
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
c = CsvDrawer.new 
c.arrs_make

graph.vs = c.get_vertex
graph.edges = c.get_edges 

graph.draw

d.finish
