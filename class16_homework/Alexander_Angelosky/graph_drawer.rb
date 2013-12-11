require_relative "vertex"
require_relative "drawer"

d = Drawer.new "Alexander_Angelosky.svg", 300,350
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
                vs.each_index do |n|
                        #if n.odd?
                        #        vs[n].x = -(50+50*n)
                        #        vs[n].y = 50+50*n
                        #else
                        #        vs[n].x = 50+50*n
                        #        vs[n].y = 50+50*n
                        #end
						#n = n*10
						s = 3.14*2*15;
						p = vs.length*15
						#const = 0.52/12.0
						k = s/vs.length*n
						vs[n].x = Math.cos(k)*p;
						vs[n].y = Math.sin(k)*p+100;
                end
        end #12*x=0.52  x = 0.52/12.0
        
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
v1 = Vertex.new("1")
graph_drawer.vs << v1
v2 = Vertex.new("2")
graph_drawer.vs << v2
graph_drawer.vs << Vertex.new("3")
graph_drawer.vs << Vertex.new("4")
graph_drawer.vs << Vertex.new("5")
graph_drawer.vs << Vertex.new("6")
graph_drawer.vs << Vertex.new("7")
graph_drawer.vs << Vertex.new("8")
graph_drawer.vs << Vertex.new("9")
graph_drawer.vs << Vertex.new("10")
graph_drawer.vs << Vertex.new("11")
graph_drawer.vs << Vertex.new("12")
graph_drawer.vs << Vertex.new("13")
graph_drawer.vs << Vertex.new("14")
graph_drawer.vs << Vertex.new("15")
graph_drawer.vs << Vertex.new("16")
#graph_drawer.connections << [v1,v2]


#1 - [3,7,4,1,3,3]
#2 - [[3,7],[4,1],[3,3]]
#3 -         [v1, [v2,v3,v4]]
#                        [v3, [v1,v4]]

graph_drawer.draw

d.finish
