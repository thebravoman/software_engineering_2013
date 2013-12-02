require_relative "vertex"
require_relative "drawer"
require 'csv'

class GraphDrawer
	attr_accessor :vs
	attr_accessor :connections
	
	def initialize drawer
		@drawer = drawer
		self.vs = Array.new(0)
		self.connections = []
	end
	
	def draw data
		csv_parse data
		calculate_positions
		draw_connections
		draw_vertexes
	end
	
	private
	def	csv_parse data
		data = CSV.read(ARGV[0])
		holder = NIL
		v = NIL
		vertexes = {} # Place to store already created vertexes
		flag = 0 # 1 - element exists, 0 - element doesn't exist
		data.each do |a,b|
			vertexes.each do |key,value|
				if key == a # If element already exists
					v = value
					flag = 1
					break
				end
			end
			if flag == 0 # Element does not exist
				v = Vertex.new(a)
				vs << v
				vertexes[a] = v
			end
			flag = 0
			vertexes.each do |key,value|
				if key == b # If element already exists
					connections << [v,value]
					flag = 1
					break
				end
			end
			if flag == 0 # If element doesn't exist
				v1 = Vertex.new(b)
				vs << v1
				vertexes[b] = v1
				connections << [v,v1]
			end
			flag = 0
			holder = a
		end
	end
	
	def calculate_positions
		up = (2*Math::PI)/vs.length
		circle_radius = vs.length * 10
		vs.each_index do |n|
			vs[n].x = circle_radius*Math.cos(n * up)
			vs[n].y = circle_radius*Math.sin(n * up)
		end
	end
	def draw_connections
		connections.each do |conn|
			v1 = conn[0]
			v2 = conn[1]
			x1 = v1.x+10
			y1 = v1.y+10
			x2 = v2.x+10
			y2 = v2.y+10
			@drawer.set_fill("red")
			@drawer.line x1,y1,x2,y2
		end
	end
	def draw_vertexes
		vs.each_index do |n|                   
			@drawer.set_fill
			vs[n].draw @drawer,vs[n].x,vs[n].y
		end
	end
end

d = Drawer.new "graph.svg", 300,350
d.start
graph_drawer = GraphDrawer.new d

graph_drawer.draw ARGV[0]

d.finish