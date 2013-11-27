require_relative "vertex"
require_relative "drawer"

d = Drawer.new "graph.svg", 300,350
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
				  fx = n*50
                        vs[n].x = 200*Math.sin(n * ((2*Math::PI)/vs.length))
                        vs[n].y = 100*Math.cos(n * ((2*Math::PI)/vs.length))
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

graph = GraphDrawer.new d

v1 = Vertex.new("T")
v2 = Vertex.new("H")
v3 = Vertex.new("I")
v4 = Vertex.new("S")
v5 = Vertex.new(" ")
v6 = Vertex.new("I")
v7 = Vertex.new("S")
v8 = Vertex.new(" ")
v9 = Vertex.new("E")
v10 = Vertex.new("L")
v11 = Vertex.new("L")
v12 = Vertex.new("I")
v13 = Vertex.new("P")
v14 = Vertex.new("S")
v15 = Vertex.new("E")
v16 = Vertex.new(" ")

graph.vs << v1
graph.vs << v2
graph.vs << v3
graph.vs << v4
graph.vs << v5
graph.vs << v6
graph.vs << v7
graph.vs << v8
graph.vs << v9
graph.vs << v10
graph.vs << v11
graph.vs << v12
graph.vs << v13
graph.vs << v14
graph.vs << v15
graph.vs << v16

graph.connections << [v1,v2]
graph.connections << [v2,v3]
graph.connections << [v3,v4]
graph.connections << [v4,v5]
graph.connections << [v5,v6]
graph.connections << [v6,v7]
graph.connections << [v7,v8]
graph.connections << [v8,v9]
graph.connections << [v9,v10]
graph.connections << [v10,v11]
graph.connections << [v11,v12]
graph.connections << [v12,v13]
graph.connections << [v13,v14]
graph.connections << [v14,v15]
graph.connections << [v15,v16]
graph.connections << [v16,v1]

graph.draw


d.finish
