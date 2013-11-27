require_relative "drawer"
require_relative "vertex"

d = Drawer.new "Spas_Spasov.svg", 650, 300
d.start

class GraphDrawer
        
        attr_accessor :vs
        attr_accessor :edges
        
        def initialize drawer
                @drawer = drawer
                self.vs = []
                self.edges = []
        end
        
        def draw
                calculate_positions
                draw_vertexes
                draw_edges
        end        
        
        private
        def calculate_positions
                vs_count = vs.count
                part = (2*Math::PI)/vs_count
                vs.each_index do |n|
                        x = n*part
                        vs[n].x = (Math.cos(x))*100
                        vs[n].y = (Math.sin(x))*100
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
                vs.each { |v|        v.draw @drawer}
        end
        
end

graph = GraphDrawer.new d
v1 = Vertex.new("")
v2 = Vertex.new("")
v3 = Vertex.new("")
v4 = Vertex.new("")
v5 = Vertex.new("")
v6 = Vertex.new("")
v7 = Vertex.new("")
v8 = Vertex.new("")
v9 = Vertex.new("")
v10 = Vertex.new("")
v11 = Vertex.new("")
v12 = Vertex.new("")
v13 = Vertex.new("")
v14 = Vertex.new("")
v15 = Vertex.new("")



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

graph.edges << [v1,v2]
graph.edges << [v2,v3]
graph.edges << [v3,v4]
graph.edges << [v4,v5]
graph.edges << [v5,v6]
graph.edges << [v6,v7]
graph.edges << [v7,v8]
graph.edges << [v8,v9]
graph.edges << [v9,v10]
graph.edges << [v10,v11]
graph.edges << [v11,v12]
graph.edges << [v12,v13]
graph.edges << [v13,v14]
graph.edges << [v14,v15]
graph.edges << [v15,v1]

graph.draw

d.finish
