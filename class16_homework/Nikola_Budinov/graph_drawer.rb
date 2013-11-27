require_relative "drawer"
require_relative "vertex"

d = Drawer.new "Kaloyan_Stoykov.svg", 400, 350
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
                r = 200
                space_points = (2 * Math::PI) / vs.length
                
                vs.each_index do |n|
                        vs[n].x = r * Math.cos(n * space_points)
                        vs[n].y = r * Math.sin(n * space_points)        
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
                vs.each { |v|  v.draw @drawer }
        end
        
end

graph = GraphDrawer.new d
v1 = Vertex.new("213.70")
v2 = Vertex.new("213.71")
v3 = Vertex.new("213.72")
v4 = Vertex.new("213.73")
v5 = Vertex.new("213.74")
v6 = Vertex.new("213.75")
v7 = Vertex.new("213.76")
v8 = Vertex.new("213.77")
v9 = Vertex.new("213.78")
v10 = Vertex.new("213.79")
v11 = Vertex.new("213.80")
v12 = Vertex.new("213.81")
v13 = Vertex.new("213.82")
v14 = Vertex.new("213.83")
v15 = Vertex.new("213.84")


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

graph.draw

d.finish

