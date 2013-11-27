require_relative "vertex"
require_relative "drawer"

d = Drawer.new "Nikolai_Dimitrov.svg", 300,350
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
                
                d = (2*Math::PI)/vs.length
                r = 200 
				p = 0
                vs.each_index do |n|
                        vs[n].x = r*Math.cos(p)
                        vs[n].y = r*Math.sin(p)
                        p += d
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
                        x1 = v1.x + 10
                        y1 = v1.y + 10
                        x2 = v2.x + 10
                        y2 = v2.y + 10
                        @drawer.line x1,y1,x2,y2
                end 
        end
        
end

graph_drawer = GraphDrawer.new d
v1 = Vertex.new("172.16.18.15")
v2 = Vertex.new("172.16.18.10")
v3 = Vertex.new("172.16.18.5")
v4 = Vertex.new("172.16.18.20")
v5 = Vertex.new("172.16.18.25")
v6 = Vertex.new("172.16.18.30")
graph_drawer.vs << v1
graph_drawer.vs << v2
graph_drawer.vs << v3
graph_drawer.vs << v4
graph_drawer.vs << v5
graph_drawer.vs << v6
graph_drawer.connections << [v1,v2]
graph_drawer.connections << [v3,v2]
graph_drawer.connections << [v1,v6]
graph_drawer.connections << [v5,v4]
graph_drawer.connections << [v6,v5]
graph_drawer.connections << [v4,v3]
graph_drawer.connections << [v3,v2]


#1 - [3,7,4,1,3,3]
#2 - [[3,7],[4,1],[3,3]]
#3 -         [v1, [v2,v3,v4]]
#                        [v3, [v1,v4]]

graph_drawer.draw

d.finish
