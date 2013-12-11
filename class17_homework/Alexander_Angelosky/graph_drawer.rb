require 'csv'
require_relative "vertex"
require_relative "drawer"

d = Drawer.new "Alexander_Angelosky.svg", 600,350
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
		
		def calculate_connection v1, v2
				r = 20.0 
				xm = v1.x.to_f
				ym = v1.y.to_f
				pm = v2.x.to_f
				km = v2.y.to_f
				b_golqmo = (km-ym)/(pm-xm)
				a_golqmo = (ym*pm - xm*km)/(pm-xm)
				a = 1+b_golqmo
				b = 2*a_golqmo*b_golqmo-2*xm-2*ym*b_golqmo
				c = a_golqmo*a_golqmo-2*ym*a_golqmo-r*r+xm*xm+ym*ym
				d = b*b-4*a*c
				x1 = (-b+Math.sqrt(d))/(2*a)
				x2 = (-b-Math.sqrt(d))/(2*a)
				y1 = x1*b_golqmo+a_golqmo
				y2 = x2*b_golqmo+a_golqmo
				@drawer.point(x1, y1)
				@drawer.point(x2, y2)
		end
        
        private 
        def calculate_positions
				r = 20
				row = 1
                vs.each_index do |n|
							if n.odd?
                                vs[n].x = -(r+r*n)-(row)
                                vs[n].y = r-r*n+300
							else
                                vs[n].x = r+n*20+row*1.2
                                vs[n].y = r-r*n+300
							end
						row = row+10-n*5
                end
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
                        x1 = v1.x
                        y1 = v1.y
                        x2 = v2.x
                        y2 = v2.y
                        @drawer.line x1,y1,x2,y2
                end 
        end
        
end

graph_array = CSV.read("chart.csv")
#q = {}
#graph_array.each_index do |i|
#	q[graph_array[i][0].to_s] = q[graph_array[i][0].to_s].to_i+1
	#puts graph_array[i][0].to_s+" "+graph_array[i][1].to_s
#end
#q.sort {|a1,a2| a2[1].to_i <=> a1[1].to_i }
#puts q
vertex_array = [];
graph_array.each_index do |n|
	exist1 = false
	exist2 = false
	vertex_array.each_index do |i|
		if(vertex_array[i].name == graph_array[n][0].to_s)
			exist1 = true
		end
		if(vertex_array[i].name == graph_array[n][1].to_s)
			exist2 = true
		end
	end
	if exist1 == false
		vertex_array<<Vertex.new(graph_array[n][0].to_s)
	end
	if exist2 == false
		vertex_array<<Vertex.new(graph_array[n][1].to_s)
	end 
end 
graph_drawer = GraphDrawer.new d
graph_array.each_index do|n|
	v1 = nil
	v2 = nil
	v1_set = false
	v2_set = false
	vertex_array.each_index do |i|
		if vertex_array[i].name == graph_array[n][0].to_s and v1_set == false
			v1 = vertex_array[i]
			v1_set = true
		end
		if vertex_array[i].name == graph_array[n][1].to_s and v2_set == false
			v2 = vertex_array[i]
			v2_set = true
		end
	end
	graph_drawer.connections<<[v1, v2]
end

vertex_array.each_index do |i|
	graph_drawer.vs<<vertex_array[i]
end

#graph_drawer.connections << [v1,v2]
graph_drawer.draw
#graph_drawer.calculate_connection(v2, v1)

d.finish
